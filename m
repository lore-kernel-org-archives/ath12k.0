Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD62C369A1
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqN6O5ULYQADoM50LR6WnyAaV2Q202v8B7Mm2bDgXcs=; b=ezemztTliugCivql39xMzp9Fh7
	V/g0K32d9KKFWumCrZYtG/WJd5oLGWknIjLSYcilGqKtIyVtQZ7OwaBm91MAEb1CF3SGI5QYXk2iM
	3mC7HqSHYv2nlvzDHgvloqH134yq0kgAiDICdg2hfgtwDIkc6wpPCJRDBYVRhXOkG9MMzWM2iXKAp
	Rjm347mhU5S1UuNUF/teAFsSiZfnf52rgYFvsyzVqzsVl2zTD1q8nU+/2lJ2BQcIkFGwLNo5KpbXn
	jImoW5MVkoQiz9XNEGIb3jArCooNe90/hY04DS2QHBpvU/Zj0em6ovc+F1mWjfBHoEHhQxC4nzfhE
	VY1dgkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPd-0000000FPLj-2UNr
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPa-0000000FPJx-3aDK
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C4CO5C030500
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqN6O5ULYQADoM50LR6WnyAaV2Q202v8B7Mm2bDgXcs=; b=Yq3bj0Ck0ZQgdYC6
	sAvqZsUJnUptVtDZDeKCkoTSG2QKK8vY8s0ruzsVpiN0aqXmaiztgHh+d/PKx3W8
	LfhiV7wD/eXYvBAlwc8/s7cQcEC1XU6a78q+pPTTFyzPXVJhHkE01gjAxrMaYiMi
	dvXQ/gdRbth514ij9FH+2CxOIpbhewbBl3OihZqoA1hmDo4uo+6CLRmTmq8SeJRT
	l4eSG2s45vC5ZkvIcpJBMc5uLOPzVjirmgnWgzsufk2C3DpXhFybxiujlH7oQa++
	ChFLh6zszpAFsQ/0fafBzIK7DjBhBXOm55Z5LsvzF/YZc2u+TEZtjf9Tly459PE+
	LD7D/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjr0f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3011bee1751so2275398a91.1
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431848; x=1745036648;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqN6O5ULYQADoM50LR6WnyAaV2Q202v8B7Mm2bDgXcs=;
        b=q6BuzdDErKCjOdvmCnXI3plDO6rKhOcqHIrN8JGYZqg86ClVjExEUOzlY6dLA371hI
         05Cc1kEF8G7GYAFodHD59dlJjR8lDstfdvfUZIn2cLOK2Pb3hNAMtMZC/rFheH5EhHhj
         lIRNf7HYMGbFSdZeja7mzrjXV1oBGlZUvGXhp/jS4y+HnYsg8lOczEtjoAH68VV3r0Er
         kf2u9INSDM0mSDWfZeCFyCKxRBsMM2zoD7pQUoqLND+/lSd+Bfj8NKARYcooOZJMgJQQ
         YQ7ynG6g8wW+XGB9O5AftcER3VRD7oAJ/64fgiZCcHr3s0yQLZMApJYilJ/WgwCMzrt0
         1WJg==
X-Gm-Message-State: AOJu0YzVdBbzqd7af4yi4rZsu5GCf2kkqdCpn+cLP8bby0IiFK4RFoAf
	kA3arPZ35d2PS62BL9xMTyPn7XD6fvHlleAelTMNLIEcYEPvqfnSTasaVP8htZ0ezed/yOmQmsZ
	GDrnpksV4WDjP1f2GcDn0YhIG0EEv6amYaccELrv1eDI1GVir7Y0H3dhOj7yT3TXc4Wtn
X-Gm-Gg: ASbGnculxB51TQflcdyecoP9sc2pGF13mlAH0mwZbPCCmSfyk4bQrhF174H8CFwb6EU
	itPmkZB4Z2jyQMqiVHsnD+S7VQVQnTwNlk2fCD1ntimRu85sYMmrTLajyN68mS/t9Qe6eTXhpPk
	Jr7NKJf2+cYwoAvqZKBXYEGxzwE8e7ylIDqCbxzT7NLiqqwtTGM7aKsEC58VZ33vxKwNgnMPpQ+
	9RR8aoegrOVOGDk4VwicnPdFOhE1txyitvNSMG3wYjXLO2qRzhzXfbHI4pvA4LKeuNCVYs+KH4c
	pyfVDmjwNTOr+TsGT+TahM4aJi9GMF59Fx4LvGEN6u/4ABVJ
X-Received: by 2002:a17:90b:2750:b0:305:5f25:fd30 with SMTP id 98e67ed59e1d1-30823623d65mr7856966a91.4.1744431848001;
        Fri, 11 Apr 2025 21:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh70vguOhIvOgg+D86CUV27Dur3Uhw5gZEQCAuuq9VzOZes/H6uRcl59Q1uDxF8mphAShGSQ==
X-Received: by 2002:a17:90b:2750:b0:305:5f25:fd30 with SMTP id 98e67ed59e1d1-30823623d65mr7856948a91.4.1744431847627;
        Fri, 11 Apr 2025 21:24:07 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250402182917.2715596-1-praneesh.p@oss.qualcomm.com>
References: <20250402182917.2715596-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: add rx_info and replace the
 usage of rx desc
Message-Id: <174443184681.2972989.9130874472554364249.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67f9eae9 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=1WJ0sSg6dNN4DLLMY2MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: cpT6VJyJSiJwZ1GzUkybjhiRUxD5pyvu
X-Proofpoint-ORIG-GUID: cpT6VJyJSiJwZ1GzUkybjhiRUxD5pyvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=433 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212410_918584_C803CCE7 
X-CRM114-Status: UNSURE (   8.17  )
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


On Wed, 02 Apr 2025 23:59:15 +0530, P Praneesh wrote:
> This series adds rx_info to capture required field from rx descriptor and
> corruption in rx path.
> 
> P Praneesh (2):
>   wifi: ath12k: add rx_info to capture required field from rx descriptor
>   wifi: ath12k: replace the usage of rx desc with rx_info
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: add rx_info to capture required field from rx descriptor
      commit: e88e6e3c9ada84ceed3fa223ce11af94fcaf3ad3
[2/2] wifi: ath12k: replace the usage of rx desc with rx_info
      commit: bd00cc7e8a4c1048d14c9a9e9790c582119785fb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


