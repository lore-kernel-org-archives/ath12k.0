Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2BDE7E355
	for <ath12k@archiver.kernel.org>; Fri,  3 Apr 2026 09:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5YFDe8MFBUG75m/VVzNofZ9EsQEjcB7NmOeE9w7w40=; b=wEo1WL/iy5g80HRBf/zjWTNRRM
	QYNTzcgxeTmVbJSBr5cVUJc39VzkWupONbbFTsdUvahLiG/mceSUzxfNOZG6VFjqOP5ctiAimQ1G3
	ut0e6Asww52jIu43ObXhJFu8RDscZ98pWIhiYHbOsb+vq7hcS93REBWg4UAwoBpe6yV1id2xDe6me
	B4Yp04KgCXBUPU70d7on2dqqH/PqaiYEql8SuUsUoEJEpL77B549l+ks7N5iyubfEnUlm7J6pfTCq
	0JBH5npxsTR8OK1NvStbp0wSngNSLfdMJWkKthSw9T2JMbm3HAQlHLA7jSWUupDQb/gQVrpasuS5p
	XM5QVbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ab6-00000001mSg-05Q0;
	Fri, 03 Apr 2026 09:13:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ab3-00000001mSH-0N21
	for ath12k@lists.infradead.org;
	Fri, 03 Apr 2026 09:13:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336EuGl140906
	for <ath12k@lists.infradead.org>; Fri, 3 Apr 2026 09:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5YFDe8MFBUG75m/VVzNofZ9EsQEjcB7NmOeE9w7w40=; b=J1rytX0PjoSiJRDB
	YEtlUo41CHvxqy3DVcRqJxkwMcLU/sAE2kO0kHLWW79DmaHlKm3Ufix2P5pjt56n
	NhIM7p/JfE1Q4CVyZFfL6U7vgEMl38xMZSTXpgI53xTGhk2hesnDVIUsfP5/ZYpf
	SgwHrfJkq1hdux9Lda/kXnzTEHUfKfA8ZQ0WO0fR/rAv5gbg4r2B/NO2hPt4DNBu
	ljvWb4WRrdMHIav24514Cl5nEkvYYUsk9Mv0mKGE0ZBC5H6bINKfx9SwBvGUHzki
	gAEzfWjFmAmbrKBXlynkEtrTz3cAN0SKraQ8JQnJ72jUc/Etp+2wgRpwJiLPXKzj
	zk0xPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y0gup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Apr 2026 09:13:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so1812177a91.1
        for <ath12k@lists.infradead.org>; Fri, 03 Apr 2026 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775207623; x=1775812423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5YFDe8MFBUG75m/VVzNofZ9EsQEjcB7NmOeE9w7w40=;
        b=U2rfZSUdNYuM6Bt3IqmlcLpahS+6SAniajJ3qyrqzVA4YJRV4t+1Dgf5xWJ5BPtUev
         M/alc3IAUYh3vS77UPNH7eE8CPPxdO4Ksebm7OgklafZ9tR5bcGawdIH4HiVF54xdIui
         WSKO3HWyCavMm/li5EjzsgheqB7j5harVNvrpNre80EqKrtDKPizbHPXWm7LiE8Jstnn
         6hoOrgfiQsVuV76x4WMloDpYKxy+QDcdd5IZ0d0GNRDydmD15EbFT9QqtrrxNWxCffjP
         izMZ2pAEkJj2Sxzh+aVQ/dKqz0Pf6iwrmEjay11NNX1f7EQL4lsNSF4c10JEmekWPiA3
         ZaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207623; x=1775812423;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5YFDe8MFBUG75m/VVzNofZ9EsQEjcB7NmOeE9w7w40=;
        b=W2EKKm7tH+ZThZ3dxantIZeB4nzzwFH5AGpTHvamcnXJ8lxlHsJQSGCrT3qzOLbC5X
         wUITAGsApuJOSXOsEa1yJv3WCzWq9utPhrgO0rkYdRmJxMT9uSJLG5Ec18KrC8v5T0Qs
         6YCd57IQzwEV4NGhb4px7cxDI3i8C39MExii5IHs6dSa0J73JlqCGV0F70xCPQblNFI/
         BNKypKWeIKcS09skIZbrr91U8vPLNFcES44bpgRUOFGfV7Wf0r8SNFOA3icZX65HZmd7
         yFiygjRNuam1xwdIVpcqaofhgwNEOCrj99XmbuiiW8qJPcTt20t+42tUaP4bqGjME+AQ
         hlUw==
X-Forwarded-Encrypted: i=1; AJvYcCURTVeB0xYtLDV4s0WZ7IfHURJ8RIjrsSkooPzCl/kV+hfWBc2he/wTwKyYzg4wwsTAtW5aNpA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUyyJ4sQYeEkJeeFVidJegSq8qSDcjxyrNyrZWToEMNdxX/pJl
	BWLQrbt4rqXX/HShO2qoQgP1+KKRuP/lz17lppGG3Fu0Cq9oHlmKUi1ywgquypTCp5CyEI0LZvU
	8pWCip0PwWJtGhjMSzI4ngwMJButFUduoy0K//sYz3l699zp4iIw3mqXaSxN+CALa
X-Gm-Gg: AeBDieuGwm+jsIUUh4ioaTkN188iF9GUCa80U0I+r+Uj8solx1ihekycOay5gLyd5DS
	6Xs83RJXw5fqjj0SG0bntIP+AW+W6ChsPTR8eZSA4Xcx8ogGbM19MkEkUoXcXBp12cjeuVBIs9d
	769EL/4W3+ghUlJ+01SECwphIkEgfCl34VYzGRECfsrm2Jrf9oEfeWo72a47qRme3bI5jwXXzXq
	dO3qYv5n81/7TYnirRTqgiyXOkaDezmMGoyAUPR+bQEi0nT3V9YcCjLKYs4QPdSSnkjwgAYugDy
	BQJEeXjJBUxMhYWaiJXYeAmrG2f7mW2hXSWQoWSdCMwUMY+W9iJQG6D1GxkaOdp9Xy+PddXN996
	iAHVhaKyWdWOpcQg5zI2HbXC4EJ7jfQUYkvndzsnI6gd6xV5J37woijut1l8+S96LjrVD7ZquyQ
	gkIkTRapQ1Y9D/nvk0hRQ=
X-Received: by 2002:a17:90b:52c7:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35de591e934mr1457565a91.1.1775207623356;
        Fri, 03 Apr 2026 02:13:43 -0700 (PDT)
X-Received: by 2002:a17:90b:52c7:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35de591e934mr1457527a91.1.1775207622493;
        Fri, 03 Apr 2026 02:13:42 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f50e9sm5182277a91.6.2026.04.03.02.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:13:42 -0700 (PDT)
Message-ID: <5a606f7d-6665-4b0c-bbbe-32538b2315b6@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:13:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf84c8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=0McBQ3JIi2lqW2-U6ZoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uFmraeOGF8ftd4JOfuMMzJEdczcha9dG
X-Proofpoint-GUID: uFmraeOGF8ftd4JOfuMMzJEdczcha9dG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OSBTYWx0ZWRfX6soM0QI9fmaF
 U9alNakU8x1Da43JSbiLLOv+o7OrqGN6971zRgQ3yQXd0XTEancwLypwT2BUbZoa4rYYpdL1qbQ
 SXfH21Kuw+ei06rm9yx6RUo12kGpL5Mw2t8MS2JblKeomwsGnfeprsgEursbAlKHW9nzRIhll5s
 7eP0SIwT9wSPv4IRGNGNl5kRipnP/U4YOnTg4y/bnBamlhquXrAgY3xQ5ftXqtdLtK7+6UzGCHu
 +gm3Hf3M+jWG9nTqPQ3itWc6z2RXZgh+gACoSPR4xOeRus/h8Enhd1KU7TiM+2YXeFqcsiuVubq
 UOVsB1DQEyQqnLB7E+53SiA0CTxKJo21UbTwDJGcXxhRpBTuqMPDDynBUYMHBwYf9UQpmkGVTME
 9ePu3zFSvak/KFcLcgmbL1lChcGbhV2NOdr48TRUIQ+kiy3abIcfJYQ61Q+0e49RHyPpDcVNCZ3
 jhsruh9u3Di1fApFR1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_021345_166396_4D14CF8C 
X-CRM114-Status: GOOD (  16.74  )
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



On 4/2/2026 11:53 AM, Raj Kumar Bhagat wrote:
> Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
> AHB only supports IPQ5332 WiFi devices.
> 
> The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
> configurations. To enable the IPQ5424 device:
> - Add the necessary hardware parameters for IPQ5424.
> - Modify the boot-up sequence for ath12k AHB to accommodate the
>   requirements of the IPQ5424 device.
> 
> ---
> Changes in v4:
> - DT binding: dropped copyright update as per discussion in v3.
> - DT binding: Used DT binding from v2 and retained Acked-by tag.
> - Link to v3: https://patch.msgid.link/20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com
> 
> Changes in v3:
> - DT binding: updated copyright.
> - DT binding: Dropped Acked-by tag as copyright is updated.
> - Rebased on latest ToT.
> - Dropped ath12k_ahb_ops because qcom_mdt_load() and
>   qcom_mdt_load_no_init() now have different number of arguments.
> - Link to v2: https://lore.kernel.org/all/20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com/
> 
> Changes in v2:
> - DT binding: Removed the redundant example for IPQ5424, as it is similar
>   to IPQ5332.
> - Added driver probe data structure to eliminate the redundant switch-case
>   logic in the ath12k_ahb_probe() function.
> - Validation completed, hence changed from RFC to PATCH.
> - Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> 
> ---
> Raj Kumar Bhagat (2):
>       dt-bindings: net: wireless: add ath12k wifi device IPQ5424
>       wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424
> 
> Saravanakumar Duraisamy (3):
>       wifi: ath12k: Add ath12k_hw_params for IPQ5424
>       wifi: ath12k: add ath12k_hw_regs for IPQ5424
>       wifi: ath12k: Add CE remap hardware parameters for IPQ5424
> 
> Sowmiya Sree Elavalagan (1):
>       wifi: ath12k: Enable IPQ5424 WiFi device support
> 
>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
>  drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
>  drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
>  drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
>  drivers/net/wireless/ath/ath12k/core.h             |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
>  drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
>  drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
>  11 files changed, 231 insertions(+), 21 deletions(-)
> ---
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
> change-id: 20260331-ath12k-ipq5424-cddb63a46a97
> 

only nit in patch 2/6, so for patches 2-6/6:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> 


