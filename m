Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8A2C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Uv6cs99HiemR8V9/EwDXZ5/vBIcxjSGZn2hCS6ayd8=; b=RitHW/thXbmLNkgPrKnFrNLGRP
	KAOdacC2AMDiUCHiVDC8qUlrPqAdB960AeQcRyqumjYBWc41R4uWmVOvU1dUKlrJKPVk0PpQD3a+t
	DYf+z/FWnDc1lSted4VWiIBzfC5d1Fw0+IkM0EiIXtn90jAhLyery2g320JXe7lrq+uL71DzooFeS
	5FlGvummMpz791hdq26AcBge2vUJKrLqAangoYpjZDofYMFozmpwP2aW3JhUkGVdx8sRE3FikuINA
	LTFZDsbPp/TSRwJJK9EvRhZShze2FoqhTwCp7tqQqVV7zHpBJBUoOzP1KCzC3QMNBT5bvKtjc1soK
	56vMaGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazho-0000000CmMo-40Ym
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 16:05:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazhm-0000000CmMC-0gCt
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 16:05:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA7hPr010919
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 16:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Uv6cs99HiemR8V9/EwDXZ5/vBIcxjSGZn2hCS6ayd8=; b=LojMsnYSxSN4EwmI
	7crfh754L0owWMTvoKELzHBzGgJA9kNYnSDZWaF0q53gqyD1S2IT/9xRg/zihlz1
	HY/2M1ZlVXQT0TyMd7vns98oY5wvp4oaxF/1q1f1MzrAw/aLHgK24uMo2zfaMjTr
	lJiSNT6IjZKsEGKDs5lpYGYSYrMb10kZ9naJoYMNF/rgMZuCLUSmpniMMuq4E6s4
	niosR8QGwTjkjjndie5fhXTCCmz9oG2B2W9iqbMHxizopgZht0XsuH4Qx/0xkwS4
	wvQIu17LbvjrPKJcRUtgC2NzjVjbL7emz4VF1/QW3pZKMdLa4xzZeOg7/qY6tYri
	ETWf6w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bkr8gu9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 16:05:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163d9a730aso23475145ad.1
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 08:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737648316; x=1738253116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Uv6cs99HiemR8V9/EwDXZ5/vBIcxjSGZn2hCS6ayd8=;
        b=eoYyh19cLLJ6xSkuNJc3CnF9MGAHbKUXWXWfIhXMhEzZa1YKzzjdiqdyeeNrJYM2dR
         Kz13UUgkX8FnBz8+YXOgyReHKxls/vBXjDA1gTJbwKmbLZSyEPo83fs/C9nq875con2f
         zCL89EVOf3TJwhXeeXkd4ZeSx8ACJyHn5+CJFhFHRsY2OtWQwty2/84/wHyItQifguo4
         rX60U/pMxB2K+EDq/QhXglwHRN5F1UDz/bJNiKeOEzUtD2XY/ysCgOGTZJK6oYHMy4Ur
         VQ0VKV7ujX1hi2cHWeGkydJ5AEuCCi4efDVoz22WdOzaV75Dr2RXwgBL2sAfUf/ZxS3T
         HtZw==
X-Gm-Message-State: AOJu0Yy9nxYq77TaV5CNOua3RRIopEnWk7DlYr2faMOoE8otRs74/HVk
	TsJT3qF7eVcObSQ3POC/9bi7Qah9f2x0K8MLnYNjcHXt87Do+Gr3PAbesrE0UIRYDHJTAbEbdNI
	7hMsj5bJV+BHFSWMlYL68gO3Zns8IQsYYbMnLqSbDkiqU13f2/3R7dWaqfiBj1Hh3VA2n
X-Gm-Gg: ASbGncuz/yq/x+xMmaI4nVkidTt8dGEwgs2weCUtjuAfYSX9LItafVssz9agBijUz9c
	Y9ZeJ8NuaO4g1+FJTmasEIL0paY54q1o+VyCfmHEnl7ySjnjhcrwYzqohukBVyyFsEHdxoW5Iwr
	7s5vQDFIcTDJGNHeDJukM73BYOl0MWW4gCLDgCwgnuX2yypzv/hTFMQe1YYEz2FzvlWBUdrZz7l
	509ER1fStAlJAqZNzwaln4SPUREokhprGL22fB1w05qoisQeMTUr6Y4IZOe7QZ2u3xctpofGuuI
	s79Kd8eVipswRxOqKA4qM78ePcPixWI=
X-Received: by 2002:a17:902:cec4:b0:216:2aec:2d54 with SMTP id d9443c01a7336-21d993758f9mr58707955ad.8.1737648315953;
        Thu, 23 Jan 2025 08:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/w3ECZuU9XMGE7OTNVjAzf93wcIjLnJUXCGoMTHsAgAo56Wg2skOEaSKmhSQGyueIEnxQgQ==
X-Received: by 2002:a17:902:cec4:b0:216:2aec:2d54 with SMTP id d9443c01a7336-21d993758f9mr58707595ad.8.1737648315574;
        Thu, 23 Jan 2025 08:05:15 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac490ad020asm36924a12.39.2025.01.23.08.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:05:15 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250122160112.3234558-1-nico.escande@gmail.com>
References: <20250122160112.3234558-1-nico.escande@gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx
 error path
Message-Id: <173764831493.2737165.16515667223221319089.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 08:05:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: z1jt8flQpXCHo0Vvc3SkKo0IdNi2BYY1
X-Proofpoint-GUID: z1jt8flQpXCHo0Vvc3SkKo0IdNi2BYY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=829 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_080518_224364_94192300 
X-CRM114-Status: UNSURE (   9.26  )
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


On Wed, 22 Jan 2025 17:01:12 +0100, Nicolas Escande wrote:
> When vlan support was added, we missed that when
> ath12k_dp_prepare_htt_metadata returns an error we also need to free the
> skb holding the metadata before going on with the cleanup process.
> Compile tested only.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx error path
      commit: 28a9972e0f0693cd4d08f431c992fa6be39c788c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


