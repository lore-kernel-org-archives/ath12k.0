Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F39C02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WE3//OQM5pXdaucVVgshH0y0fU0kJk0nrQaexmq2EGE=; b=REDqup0I/9Pz+la6fBYywb04nO
	iARX84MgfDy92idwQ5GPCBPLu5cXfIjAlG0Kc08QiO7kY9aQorzMpv111ebmnjO7d2O7c6glpmEeR
	GLMGKIp+VcaJ862XyVrXnWB7CuTc/dS5vXnRj10NHnCv5AHXo4lwAZTx9IZgwBLSFZ7c0mej1EUBE
	O6MNQsWDUVMO71iuYssD5FIblJcRnKHDoYkIREXNL2VW74zVs9NqPCLw+IawxNwhyeTKyA94+E8MY
	MrjhmeIcP1CiC5IfpMGtKC4TALnx/RM7ANLHbkMxp8k6AjiDoa3qcQplXRC2L0IcCj4FNwKWsGInw
	BgTPxDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTx-0000000HR2V-1Cy9
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:36:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTv-0000000HR1z-2OJz
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:36:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5147Gj7k011673
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WE3//OQM5pXdaucVVgshH0y0fU0kJk0nrQaexmq2EGE=; b=fDlcXnUrYVnQEhFG
	xpAhjN+PBlXpdKzyjom42CItEiMWMAVa97Pg/hU/7CN+KhPR2gHvVcM7mwoiLkwy
	LlmOv5wqp/vGJ36H9GYcsaQwFmNsL31XUbMoMzUQ9jq7D30wipdssWcuct4/jJYa
	dmyY4bHoxrvZarLPlRwE9I4J7oanwPZWb5/4/u0mhj7zWhRM9E6sPj4ucpFbRySO
	m+9LOeuY1/8oNZkVB4Bmg+pyKa1yFK7DcUQlH8Xh3xeMBEg79BVm8ezw9Cxl+SEl
	yAg3Kqn5mReUr7fI2GVESlu2bLSAGaHAQs20Lpi/+lRDkAtZvy1/ErP/o4mUQnRU
	6AaJ0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kec4017k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:36:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21655569152so117636555ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654586; x=1739259386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE3//OQM5pXdaucVVgshH0y0fU0kJk0nrQaexmq2EGE=;
        b=vBH7F4kYlGZLjIlfw3zynAFO2bY+dfq4OeLwMR+T88EbIX/Aq2INk8yNzGZ/oOZkoK
         d3nXqJQsmDWHnbYDD/PRHW58TPc4IHBUVUCrlQDcPVmoWJJh6IPRVkWf6trMBjQAwg/S
         xEK86gb9WHw8mMaz17xCyx0ArBBtkAelqP58dWMieTA0S6BOBagU8iUgiSJK9Sig9dZp
         jewm8GzvxxBGA8kbFGwSb3PknMHXEzmn6hsIxa7hkEvZBmgRjtbbxoqF6oMWbDBtzAD+
         SVW0MEYRyQeIc7mx9yT9Gc2jYK/jgq/t4WUQXuVWMnpN8AfhDZe333+CHYacmyJbrGbI
         DPvA==
X-Forwarded-Encrypted: i=1; AJvYcCUoMDThcdOUUzO6J2j9NhQ2X0wS454urF9hd+ggtGBRwWNVCGZ/XkfTUy3ZfWwnHFCmaDY9n3g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPOTUI7zr5FPctTq5AFFmz5ON00oU/QItcWnLTza1y97rYdNfX
	+iejuusdIWU7IhrY7V/pfdiBBbEQyOfFuwVZuDlEwsmFhK8weSGSl5o7LgVvsA0siaVYrE07tEh
	6qkSPrHrEPvqjRCXDhUX7Ya3qF76V+tm3s2iHp6wZ+qaYeJIKN27bMgDwN0Or
X-Gm-Gg: ASbGncvdS0rUAo/pLVzbPar9/MI6Z/v48EXUR1WYxGDvd769NFLoTczyC5rlavIujed
	7RuQOBoTcucstzZqcEyuB/nQzlSP0EcJwsqvfgrCXocp0DChYPS44s7wasovJCZ4/1HnjP2V3al
	JWKZQXxNVtVrOJCgUSK9RvhDVOTWeEzhVYocX9ZgI11Pjf+Ju84D6OlYNislOmCtkhBptwBCXV5
	6P5cfG7QQpo9ej6f/SR/4GvN244p0aWC/rQKrSSjo/DT1ObffE8GJU6K/B5zaYUPMbornC80cgw
	T2U1wJax+vxyex+jQePef5ewQQ9sUpK6Zx+PF823272dORg=
X-Received: by 2002:a17:903:2b07:b0:216:4165:c05e with SMTP id d9443c01a7336-21dd7d787f8mr464939165ad.24.1738654586340;
        Mon, 03 Feb 2025 23:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVtpRw7hLlUBVdkkMj+yMEet/93LYwVV01hDU07I9y5swZEPjUMH3XSPFMb6pKgyn8ozqnXA==
X-Received: by 2002:a17:903:2b07:b0:216:4165:c05e with SMTP id d9443c01a7336-21dd7d787f8mr464938855ad.24.1738654585965;
        Mon, 03 Feb 2025 23:36:25 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee0a7sm90068475ad.18.2025.02.03.23.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:25 -0800 (PST)
Message-ID: <fc1df129-e859-afe8-a883-cc34f55e22cf@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:06:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] wifi: ath12k: relocate a few functions in mac.c
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-6-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-6-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tbm9J9AerUsvk-u_QWC0_I1NmEUp0MkK
X-Proofpoint-GUID: Tbm9J9AerUsvk-u_QWC0_I1NmEUp0MkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=768 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233627_615683_B34217DC 
X-CRM114-Status: UNSURE (   8.72  )
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



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> An upcoming change will invoke ath12k_mac_init_arvif(),
> ath12k_mac_assign_link_vif(), and ath12k_mac_unassign_link_vif() from a
> line located above their current definition. Hence, relocate these
> functions to above so that these can be invoked later on.
> 
> No functionality changes. Compile tested only.
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

