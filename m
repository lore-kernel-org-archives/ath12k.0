Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5FFC83F25
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPcgGzbA0KUdErOP1JgC40238+925SiPcxECv0Z461I=; b=oosMtlJx95hbAZGBOcyRT++iyW
	Lx4ZmwUp7Co72qyWSVodY3vZ7KdGii79pxnVpKDAVmgjCwBeEeOgZsJwtghaBMLUKwTuyy0GoQ2hL
	z8n5ZoPTD7CCIWWbdLvkwKk/xu90eU1wcVJt+tZMwyyJ9VSs9ypC+0p+2xA84Zfbnn8NcxyI5DEj0
	5sZCsO3+zFH87k6kArCOzEEHgQ23kl3Q6QvSRkuWllIklOW5E1QCP/HAYxaj6X7mq1jWoMYGD4Xnw
	gLcd4cgW/G39kh8mVmegXQLz6p/Xpm0Ae9vulkmLsHcZ3YGkqHlvmZdD7EEfp+HvjWUsuUq7J67H1
	rT+hH53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyBz-00000000kCE-3xix;
	Mon, 21 Jul 2025 21:37:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyBy-00000000kB0-0iJd
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 21:37:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIg8tB015188
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lPcgGzbA0KUdErOP1JgC40238+925SiPcxECv0Z461I=; b=k8WmnVEi3w/vwsXW
	PwPEk9Ty1pJh8wC6vP4mGm9uNQ75iYArLUuF1I68umdLkyEEgzmEcFO+wLtSn8FV
	hbylqOYIabCi6xOU+s0M1z8Jdk1YoTNIkpAstVwmija5sjaOjtefEJDNAm5INhK7
	NNbdTkY3dQ4m2g73kRgy1dwqkE/G5IL8T4UDgWUmMhIisdHyFH7kVouUW4n3EUYF
	NTSUc0yGoAIS5PLSHzbxY6ggRUOxZuaF9iC7GIsob2EuCVW+/4eWxefUvJAcYHrc
	bBbJV34B0coeeFvaD6t/Hmad5xueBCevf4Bj7/cWE468cSVqO5yxe/6gd5ESXidT
	BnYZwA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w0bmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 21:37:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31f4a9f67cso5342213a12.1
        for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 14:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753133820; x=1753738620;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPcgGzbA0KUdErOP1JgC40238+925SiPcxECv0Z461I=;
        b=psAiELI7+hYvC+RU0rrL/7wSkqMqYSZrTXnci5tTaaAoQGHwdshhH1DRQbUULLTBBr
         j9SM3MaCvs3uUckYqpd0NyeXkESko19BcoMa6mwOseswm6WNmzwi2Pz5kGK5s9NkTO+1
         iDpoceMwLBShQlBAS7JSV9uCQ+/ZVgOjwHWFbytOIPDCWVlvzWOkg8zND4FDOZfv7Xh1
         Qnukqaj1k0Hi98YChfICC5sonRyu+qShNSpep+fkDNIqNKkQzzGT1rSYWcdkJuzSpLKm
         LWY4+ee53Z2aBdWmgVYQs1Ve0qBC8edQfNzsJqrE21cUBc+jP38dpLGTV/xPZSEGW/SA
         MjJw==
X-Forwarded-Encrypted: i=1; AJvYcCV2GvrOdYyinnkK3pCqZSHgA5HhocV/dy3a/cJJPmjyc1VBOhzjR+1O9duqUPycxWjesAN3zwE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGJoqwWgPN+9HUppzddGK0N1LDMC1xfkOw30JXKdRGIbtxkqWI
	R1YXtzSL8Y6oTrvEEHCBNC4/8zJV1vAMM7+hLsObYK3UOeuKUuknvGDNOAo5sTG1OVTd8IkVq1p
	2FpflT7eQa6gYDSY+17tdOPqD4vo974u451zv2SPvoFJiIqIzgTBGstcowWmPRnozPgCdtq9G
X-Gm-Gg: ASbGncswitiitytyioFR0Z0IGBn9PZocp68dKCL3hB/j04L1JpXloCE8zSHECIJQ37y
	iQeFCuVugZ3PTcSQ7V+NN5UGkWemB7aiaA+VEF7FDNrRx9ANglYNhAfY4bPu+QCKe6b/JbGWFT9
	BEdBy7j/peZA13EDKG4aGUwys/c5bEo01cGkY8ijX+/+Wt1NNWHXWXbF/oPI5En2E8Mq2FyKeJr
	/Aw/FleCjfPcMu3DKqjFytKR4k853LMjbBahbiYiotDsMvhWfO9jTOcsPaCknA3UP6AZr7hgAtL
	92kld1N45E1SBEv/CSoowvMB893E/mX2aUI6V3OCN76cx0u0LlJEeUVHqwVKN9G29ZG+CzS7yRp
	s
X-Received: by 2002:a05:6a20:9190:b0:235:d440:ae6d with SMTP id adf61e73a8af0-2381325b204mr32639340637.32.1753133820581;
        Mon, 21 Jul 2025 14:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELTqLiRg4xv5sYJl9vyevXPnhafiBzP9GM1aTX2FGfEeKB47zqZOfLEblRRt8Uo61FjlipPg==
X-Received: by 2002:a05:6a20:9190:b0:235:d440:ae6d with SMTP id adf61e73a8af0-2381325b204mr32639319637.32.1753133820183;
        Mon, 21 Jul 2025 14:37:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68046sm6201934b3a.151.2025.07.21.14.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 14:36:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250720-ath12k-zero-brace-v1-1-d8c8ca9d40a8@oss.qualcomm.com>
References: <20250720-ath12k-zero-brace-v1-1-d8c8ca9d40a8@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Prefer {} to {0} in
 initializers
Message-Id: <175313381950.971667.2781590137376114302.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 14:36:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687eb2fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ezxbitWhmWwidbw5SqwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MiBTYWx0ZWRfXzbwGDM0jNbgZ
 sSJZr8SH5M4hPn8ZAmH24L4kVMPMuC6s0yOMYVK0LE5Y2KHo3N1128qTE8bWePylGvcNB8IQZ7k
 HRbG/whoTHMNrWiEnIOp5OPrN3iTFyYdCRpPVrI4tkHzIg6JZOJgM80T69hBnP3MngjhXVOlxms
 2tnLi4KokJXaDo0Hu9IaEknmPbgf5Wu1lj8YZG5ZkN3ZOWTZdBxQXKCyDgzniOU8+IHwEB/iMVg
 Jz/7/1yrzD3cWF5U+lCCqb8tBy+i35dZV8TDtdR70tvEEh56rWyGa25Dtnpw83+uHWa+pJg4yBV
 5iYpJFyJyWkYSQtchsrDbgv8oJdPZKS7sxplsPSfqqDlDlI4KD2FxwzP9P0wkOnLNu+s0rsPN3s
 NNS4Dy3LkxESPSUyCHvSr9EMw8lhpM00V7QxjWvO/aEkT7Y24VGzRHJ2SEbQl82t45M4nR6w
X-Proofpoint-ORIG-GUID: JCpGYXAbdjz40947BKtfCbWsiVXxeMdO
X-Proofpoint-GUID: JCpGYXAbdjz40947BKtfCbWsiVXxeMdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=683 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_143702_214917_BF650703 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Sun, 20 Jul 2025 08:24:14 -0700, Jeff Johnson wrote:
> Prefer {} to {0} in initializers since {} works even when the first
> member is not a scalar.
> 
> Generated using:
> sed -i 's/{[[:space:]]*0[[:space:]]*}/{}/g' drivers/net/wireless/ath/ath12k/*
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Prefer {} to {0} in initializers
      commit: 306facc029ba8d217ef5a46e8cf4bd50c70603d0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


