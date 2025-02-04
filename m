Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D081C02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmhZf2jtZFOhpBYRl2QGSrvfhYgmFz43h5DbYsnxQXc=; b=Xga69GJl9IHxalmJ8aibjVLqDd
	3Y2J+MfkVTHzkBcr+fhsPoAi4Nl6IvHLPzvwH9MVh/15u+v9SBugnqnRTgVNWQqqMyTlegSModSEo
	qRPt5cVpZHTEWbVeTPSpk4WUWPy2VdSXdOKaVH3NS557QkgnpnjEIzN2Ha5BHPPOI9sIewQxHXn1s
	TNU4Yavo+QpFZo9gGbzh5CHpIsIHQVvd74ImZtWkwA5YBm9p55joY5EbrS2t+caStbod86MMcTZsY
	V7cNiaPDlcoGTdz7VpU5PZkD767aYm22tpZaprAZy+vaCBVeHEHJOys9QT7g58p7kq8HRIy0hXkGq
	Pz8X/TTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTm-0000000HQy8-3sBm
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:36:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTk-0000000HQxV-44xJ
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:36:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQj7l027019
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmhZf2jtZFOhpBYRl2QGSrvfhYgmFz43h5DbYsnxQXc=; b=Ek8hssLvbAp3HLsl
	d6Cems0cQ7UVrrtOzbw3rP9RtUvlU7LZQxImsvUh9mNHPoYQADnNRM/5M2RgKMxT
	/txFPJBT7brVeDMQk4Sc8iYLwHFtqyNJw3BoV7O+HIo4wy7jEsRxexnk+SairqKH
	NByr3jgpN7UTLiqDB3KdLumxG2DkSUr7rysvbJeWKw6CyOp7phFKSFJXCS56jero
	yMEjKPOSSXhddeRCxUcSDD+X1WkbFSQazlwNFXwDVrL+8niI84unV54g8EojG78y
	dNgg8fU+AFM58V1XcVBKtEd0n+s5ahd9jSo6rrFFU3pdRMeHHNLmOJf6dsf1UlRu
	np+IkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufs705-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:36:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2162259a5dcso186138675ad.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654576; x=1739259376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmhZf2jtZFOhpBYRl2QGSrvfhYgmFz43h5DbYsnxQXc=;
        b=J7tm/PNGOq958ubVNVI1oEHMFRW5jxnN8wh7ChVJFqoLA4WvRAtG8x/0g96BIimaxl
         5Cwgc+SenSJVcJZNpM3OM9rU56C+7sKm23XnrJ4U/faslUAHIRNi7GFh3tE2wKxVRjOA
         gAffdx9nJtkC2W3liTyqtTq+4f3Z0VhP0Tjfp2QJYhPvpZJnVvgNC8VbcDJ4dtiZPQIe
         T9pp1vRi/p0G/Piq7hNcS6sfSL1dPRWfS9s54f0xzCknKdKaJsAEDv5BSNYoybLfpF0Q
         VX9DBSDlKIRPN2ZXRfbrFmjbt8KLFuNhDq6y/fyZYIgvN/N0FfeW6fMjH8MWZ7Kc5uzC
         2u5w==
X-Forwarded-Encrypted: i=1; AJvYcCXLlJe9x/fUZb836zcZJhirVyRukJwAS/o9YgkdlN2+0sw+rsLzsJNrmrqDU4Itmj/mcbhKh8M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZDjrILWQVLoA1N0eTd++3kEdQoq5kj9g0slIhE4HFHrvpE4G
	b9PJtwMCT3Yuqlnefhk6eMfBumcwtjlEd5HWtbY4E9OSV+MLZXTRR0zorWxl58s4uCTPF/T9dsK
	ORgVqR1ggzbmjdL2FZOyaO8yb57khtKL35HeGrVhlgYYyNuO4ZtmY7frJpd2A
X-Gm-Gg: ASbGncutrzArPhKRsAVsxdBr7FGNJG4D4JJM6T5Wlur5IeBALA+I2RLY+viKrQlYj+g
	jbA9ROtLRKOgp7N//agNGDYyW67fi2ONG0ADN396fz/9UdAItRKPnyR9NJHrfDEjUXOTlU71whh
	C69b2AR1m/FH1uZEltWp3EponqnI1A3/PPU2d7TEU11Kw79PNZ3E0VIhVOh/ICxIVYaHTFOo4VN
	j79q1Zy3OSjrVaHucQ8TWvtBCurvew/2GUXhn0oTx+N9jrONBfuv5hdvdRlx2rzQx4iVrdbb3So
	OwrzgU+HeFObST60CbMOi+9wpOT19JA+TUqDsFoQOzTmPH4=
X-Received: by 2002:a17:902:e5d0:b0:21c:1140:136d with SMTP id d9443c01a7336-21dd7deefabmr438784505ad.40.1738654575722;
        Mon, 03 Feb 2025 23:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBJ1xxgLF4XGmhl1EYxqcc54FnC35M9tEB/AjgAeRQpmlzCyfnNfRRLtDm9urOOoIV/+qunQ==
X-Received: by 2002:a17:902:e5d0:b0:21c:1140:136d with SMTP id d9443c01a7336-21dd7deefabmr438784225ad.40.1738654575341;
        Mon, 03 Feb 2025 23:36:15 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea80csm89749945ad.140.2025.02.03.23.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:15 -0800 (PST)
Message-ID: <aeac367b-00d6-4dcb-82bf-cda8307fd0d0@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:06:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] wifi: ath12k: use arvif instead of link_conf in
 ath12k_mac_set_key()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-5-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-5-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fhX3FW283YRT9RC9TjIp8rmigWL8Nrsx
X-Proofpoint-ORIG-GUID: fhX3FW283YRT9RC9TjIp8rmigWL8Nrsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=893
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233617_021607_CB164ADF 
X-CRM114-Status: GOOD (  14.63  )
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
> Currently, in ath12k_mac_set_key(), if sta is not present, the address is
> retrieved from link_conf's bssid or addr member, depending on the interface
> type.
> 
> When operating as an ML station and during shutdown, link_conf will not be
> available. This can result in the following error:
> 
> ath12k_pci 0004:01:00.0: unable to access bss link conf in set key for vif AA:BB:CC:DD:EE:FF link 1
> 
> The primary purpose of accessing link_conf is to obtain the address for
> finding the peer. However, since arvif is always valid in this call, it can
> be used instead.
> 
> Add change to use arvif instead of link_conf.
> 
> A subsequent change will expose this issue but since tear down will give
> error, this is included first.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

