Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58D7C369B9
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 23:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJcf1iGzJ8hvGO2iDgfTfCBMOCJfFaiW+CZVE7Sw9+0=; b=4K5O5JqjOOuMZ9OQ5v0T2pyxIi
	AwnoIxHxRHEQyKJkSC6NnX9hK7U1OVXtvk/WmgiEt7Habok1cUqPGkNT3+XMB1+f8Ne5B8vaJiqNQ
	0qRu48FNuqwvR/huyyEzLyWUzJKXvPg57HtieeWdi7Rm9MQ4/3rWrH/ma/bJYTDljOJ1fFA5SW+/2
	GnQFg5KGRUmzVwwP6mW/eYwktPeYNQ1XWXREnaOMtNo5SjhTaa2wZXy5mDbs2GkrFzfv4nDSwx6ch
	kb4jtSIeVojvWswojpPOsrPaCH6q41JUnjDBX6XT8iqp2nF6KFIAp3UXZJ3LTyoYNR2cOCcP6vdvG
	jt23oCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4pcE-00000007T0U-1zaP;
	Tue, 15 Apr 2025 23:22:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4pcB-00000007Syd-24cT
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 23:22:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FHj1rG012575
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 23:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJcf1iGzJ8hvGO2iDgfTfCBMOCJfFaiW+CZVE7Sw9+0=; b=IwNZlIJkrsZF2Hqf
	CoVCoCFWLyny264zWYG5Ea8+LVfnBgCKRdgYHnPoQkWc0VHb4gidTFQVMIu0yOdZ
	3FCaZJZ06JVvGSDV/Xo1AlQzNpwYIZPP2vB6E41VeeFmkvzWzZIhFi7MAvrREJKP
	Fc4uOS42ZgIXuBNt6UJUADHpB+A/NVK90sosJkm3E6qoVneww2C9XC8+NYBw8E6a
	pHynHws9nY1ISBSlPRLUZAs1il8GWhZxp0mUtlVKDuOopM6XZXQ/Wlt+K+R2Elrc
	uHWNp0Lp6sw5U8tb8pp6WSDutX6h/R9HUE9nN6W4rqNF+Srb0Ozo92TQzcmQnqaT
	wWd5nw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq9vbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 23:22:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b073ef14fa7so1751811a12.0
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 16:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744759368; x=1745364168;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJcf1iGzJ8hvGO2iDgfTfCBMOCJfFaiW+CZVE7Sw9+0=;
        b=Lb3UowHz22FXv3OYE8EcaMmMr9Hafs2Smoyr/AywTCq0OTvGn59x8EeQz40QKGaqpb
         TuT7KkQnmxDUGQUwysp3aUhAhezGi+ekeMPyg79oMH3G1tOiU36ELMdyVrsNLNQh16y+
         gJFuT1hgy8ekf7F9RxbD1PTW6GN/8xyaWOnik3x5S8Dj7L5yQnvwl0sp5kaAM8HhSL6X
         fjYpb8VmUcuMdiB07Hxr43BfPBMQNCqaBC1idg+zK9xNIr06H8S/Ic7qsFS5O6Fn/nQf
         UCQK8dclbXMwqmuLUX6AsvgS644tKI6MpHSLF2c/NoAU4PRqdHcwWIe+7zGI+UgxFJKy
         836w==
X-Forwarded-Encrypted: i=1; AJvYcCXE2Dcq/RjRi1xAtyWu4JQQxqqIZN04U4IqUYLriyRdxQ/CRtTEiDwkfdccGR5/Z7XJfN1epUQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqF1wgZ7CfvF68t7+OF8YmoUcMx60QcR8+mPzf3Ba/bzYbNsYh
	6KE1FhXK5OLg1B3AwvUIihglRMDqeIB4V9hSErIkdqkeDOoSeZK/Jm1Y99JtkL5pR30GEHXWHbX
	oHD8GoE3Bk8codUG4Mo3HcOQUpLDr2Wlw3P3gE5LHTNj2amu4ZACFch3DZTy7tgMKswpP
X-Gm-Gg: ASbGnct6rpXaHuVtxDm7wq0IkgPpfdfVbbUk6gI7byi6OQa00JA9PUNp/rouHL4PFat
	apbkotWGgonF12tIODV9HATST5UG4SXIV0uPyal1X+agLoAvjLvCijSzI2H5kNIvCfIc5UzRamN
	gwSwivXdJAFoq+M6RgC45NWktHOf+YnSOD/YwuN95jqzdK85c/0iSSEkzFjC3lAwUQ0RIn07/8Z
	V1tzHX8GUIYcz3Oylk9lyEe/a/CK+zxMo1DaEzvoU+fC/lfy8jgihSyML5OupPxjzu15SmVYhHq
	Pyf0qxL31uoHovKhGHyKAzrY4muWlJlbWsLLKytvix9/nFyuEGDPZMvWR5CW3car62aiDLsnofN
	W2RL/
X-Received: by 2002:a17:902:d492:b0:224:1c1:4aba with SMTP id d9443c01a7336-22c31abac8emr11421205ad.50.1744759368343;
        Tue, 15 Apr 2025 16:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+jBVAqva7ozMrbvSnAzcxIfkA5OTu4Bc7w8zR2NNkixCoFXJ1y8Ha2vsmYYStJ1FRF4yZfg==
X-Received: by 2002:a17:902:d492:b0:224:1c1:4aba with SMTP id d9443c01a7336-22c31abac8emr11420965ad.50.1744759367958;
        Tue, 15 Apr 2025 16:22:47 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe6798sm899615ad.216.2025.04.15.16.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 16:22:47 -0700 (PDT)
Message-ID: <bd0f1c55-e685-4ed5-bb3f-95e521bd3e1d@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 16:22:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath12k: correctly handle mcast
 packets for clients
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250411061523.859387-1-quic_sarishar@quicinc.com>
 <20250411061523.859387-3-quic_sarishar@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250411061523.859387-3-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i-e-cFCfQ8_BIjq_TZhnPNVChdDJqEt9
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67feea49 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=XN0JUVIU5v_tRlagsdoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: i-e-cFCfQ8_BIjq_TZhnPNVChdDJqEt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=704
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_162251_675616_3CB7BB49 
X-CRM114-Status: UNSURE (   6.55  )
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

On 4/10/2025 11:15 PM, Sarika Sharma wrote:
> Currently, RX is_mcbc bit is set for packest send from client as

In pending I modified: s/packest send/packets sent/

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=f2358d4e1724e40f8558d713cac36710dbbc8f37



