Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994A0C369CB
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FrXdXfKn1pkQoWv2x4hW5hrWsqwmyyzobvs3cA0SnE=; b=v7fPwzZSmGMNUjY9HIQEzKO18F
	V8nSlby2t+QdoZBeGiCPLLI8ZvhRmiEH22RT569TK2IbOssJvDxV7jduBEEmGe6j/S+t7cgAOuyMG
	/3jvHlVM9wKpnBtS4bw5Bd4zYCO6hOmGxXbnhyldB7HE0syzAxeNH4+DNidr3Xe47BADEPRZaaizv
	ZhrmZBfAJCj8JeBYQwEyk+RP+akfYWWITP3qPUonYPfMXnDeHIpJP8/tEoK0XNsa+qiy+xH9+SODi
	wI518hEgLMtidE9v1hqfB0FAfaS4B7T3gIpLUcbcQ7p7dNGWT6hRtfFEd8NumEXQ/SmcLNmIH3sdv
	6JAnSK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YB0-0000000EVVP-0qfl;
	Thu, 17 Apr 2025 22:57:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAu-0000000EVP3-3cOC
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClUTY029653
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FrXdXfKn1pkQoWv2x4hW5hrWsqwmyyzobvs3cA0SnE=; b=YbuJoYjYSt49y15e
	L5+P8mjuE4nNYft6SMEMSVIlJWlgEXgFFvc6MYUCNdg+Pb/qRpCTGI5EW1NMnKYn
	ttvPl00UDgVC/OgJKPkesmCHxHXC2GtbNGu5A2aMoe8woPid07l85WWtxeQVCTST
	QkEkp4x4flmRmCcL9kvjCVYds0bpNFpqSGcA6xkq93kzVIc8yWFmDkgskuks6ZWr
	OoJvmgjebFFV+wKE5OMblr4DPRawDDLuCmQpre8J9sKXPmVqKkcvphhgRDBdJc4T
	N2szOFUtgJwl4HTf/X0hqLYggFblwTHJn6N/+oPH+scmfeFPi4HNb92/E+wM7d7x
	8LdwdA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9gcsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736d30d2570so1080187b3a.1
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930658; x=1745535458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FrXdXfKn1pkQoWv2x4hW5hrWsqwmyyzobvs3cA0SnE=;
        b=shzbtD9eZGKmgdnv9MOwvw03coASJll2QxKuHyMOvpbQ2AD9n5PuOcPOPJnN+Kgb7k
         ANaGadz2ruhWsX4Sz0lXAJibaPcZIpV9yD2dmBah+GgNDlefRs0El9rttl5jRMHdcZh0
         zXO1C+jviyr08sawAUTAzKc5UwqvwNmNORAin7V4vhWMHAJ0KUji78sP+0zym5zJAVoW
         uaIqxCCUgXAHrRynUvwKt0raTdpG7mLRQkaoMsQugwOwppepzYBgcx/V7irLhnYs8T90
         9VnEIJRwTaA2oQCE9qXBgsy6PnO82akPHxy5DiyFE2owdzNO/tZiM+Ig0SttZliTa0XZ
         razw==
X-Gm-Message-State: AOJu0YzbAe4/Tb+U61+Y8ZPQygt1PyQVuSB975KuAYnTGlZqDFr6SxhK
	/RqmhtVEwP4y9vGI9CzIUTQ++RQg8xqDZ8Q+fImrWCBpeDu6Nb0BiLg/vAym0tVTUGh8mflfE1V
	twyVE3ryRjju33Xo+iFRqFvR5X+9/mEqzwk6QKCP2btgSiZWyTT0VnX4smJoL
X-Gm-Gg: ASbGncukSdlK1HjrhWyszMZnh4He0SI4P5l2Z6vHSAGqOLXhIF/kAz/t/fXmLwETr5D
	Tl99BuY9VOLkjMQjw2Pw/QPXtKIwsjTZQQ+ECnjuSASx0vHUmj8PBvXmaQEhcsGzgOw7JqkUDqd
	/AN2SqtrthoRLhU0ziS684c3D1BpRQSuqC38YkXd94b65nVY220+iUHodhkNVO9TBQjr0XGvc4L
	Ua3MD1HmO+8kM4uLmyux2RgiKYOQmUy9Iaq+zxNCmaeK2jKzyGjhBCkWX0vYed+B1v9aycsroC9
	yG/dGUxhFbr3EW8FehkBeUZPUizeQIp5ltRbXkZzFvqfDVjj
X-Received: by 2002:a05:6a00:130d:b0:736:47a5:e268 with SMTP id d2e1a72fcca58-73dc147bc16mr699385b3a.1.1744930658551;
        Thu, 17 Apr 2025 15:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/FhH9xI7ejfEn1tmqvo8hWWXE0D8iyWG7md3JQuKWv6BGHRPFOKgaerSLMtuRhFWum7CQ4g==
X-Received: by 2002:a05:6a00:130d:b0:736:47a5:e268 with SMTP id d2e1a72fcca58-73dc147bc16mr699361b3a.1.1744930658071;
        Thu, 17 Apr 2025 15:57:38 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250409052647.81955-1-praneesh.p@oss.qualcomm.com>
References: <20250409052647.81955-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Avoid allocating rx_stats when
 ext_rx_stats is disabled
Message-Id: <174493065745.1347382.5634882723747962962.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:37 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: rHNfzaNku58-JOqm7073x1pTnDPJovLv
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68018764 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dYJopINmuo2x9Eb5Rh0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: rHNfzaNku58-JOqm7073x1pTnDPJovLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=683
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155741_026935_F47C1D79 
X-CRM114-Status: UNSURE (   9.23  )
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


On Wed, 09 Apr 2025 10:56:47 +0530, P Praneesh wrote:
> Currently, driver allocates the struct ath12k_rx_peer_stats for each
> station regardless of whether ext_rx_stats is enabled. This structure
> is populated by the monitor destination ring for both single-user and
> multi-user scenarios when ext_rx_stats is enabled. However, when
> ext_rx_stats is disabled, this allocation is unnecessary and results in
> additional memory consumption.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Avoid allocating rx_stats when ext_rx_stats is disabled
      commit: 25be5d1d1e050f45f4d52b2cf9c8e4b6382075cf

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


