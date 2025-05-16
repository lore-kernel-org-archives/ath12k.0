Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E58C54756
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkhlzN+qG5vNuo4h9xeRD4O3lEA6KR/53oS6kygqww8=; b=iM2GfaTSbZL/5hegkwcnNeklAl
	f2jlKhnlJp2P4sROlDl0dQXmagg4V/mLJwWBCgViqILW0LF81IcuXPOPtyyCMYjomBftMtglvUiEo
	vKp90fDad2n5UE7qK4oS5WTQjYXpWwtYbdlScAqAajBFt4rRETJacg4zFIQRKKxFMekENp3k+v8nd
	Y7v+XPsENecOK1x4RMMN6FTPoIrysNqxsH7IJhim5+P2ZgIqAZ7MKHAi4cBUIa603rf1R8x6LDupy
	83dWT6lCatbASiEG6srIExybK+AjDoDhjdn/7W6JEpO6TIqj1LBuh7Ek/xcrIxJIIGWTWZAJznJwv
	aibZJYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v6-00000004Trh-09qR;
	Fri, 16 May 2025 19:40:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v2-00000004ToK-1VI1
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:40:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRl09023154
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkhlzN+qG5vNuo4h9xeRD4O3lEA6KR/53oS6kygqww8=; b=hTAzRixjIGOgEU3z
	b+tHPrBVVE2XhghiiFIa0ColwaYpQu4TGHDFPoimEkVEWyoEePorBqbV079E36ok
	SpOF23WWwDQh6n04GMZX4R2EyUlaibXfnEHBTZLhIQscvolEfP0bD6IgqDLPA7m9
	VdfAocMeWMDopXbUW4JjwgmI22Jihf+8V4fIZKwAdDi9S4kK8VM9pizKPDEkiPdj
	+EqHEFcuUVSkNF5CBTFnwioojIPTabBUX3W/RNVrXM8mBDTwNaVyy8oduZ8sRsTL
	qX0nWU87TkjjVkpCUTAn/sWqSa8hGw/Dviv9umx3MdVXfk7WE+PLJqRndKSuXU/0
	Z43AxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq99n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e50d4f49bso34887555ad.1
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424431; x=1748029231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkhlzN+qG5vNuo4h9xeRD4O3lEA6KR/53oS6kygqww8=;
        b=t7FfCUFhw0CWLVaDtGMFD/tSUP/IJg+EvZJTKovhcPm6bUR8+P1oSVqAOGKbRUbr6j
         ojSR2BzGsCZXkgqW0SMjBqVY6XgkHhHQxXtM6nLuyEy60c2uN6yJ1YKT3X6U/p8s7y+8
         jn05M//hu1eKEmI9P8CzqLpTSgnCrsQB22T2YkXwobjmwMR/XaQohhrenlHz4sngKz2v
         moFyvSvUjwge+7BSpw7F2JjJxM0E44TQEaPIgt9ZNy3tfDvHsdZlOyoBv9J2qe1YA6Ax
         r0B05QnZ+X+5mSmhm+SIJ1QpjgoVUzULcLeQTMvxo7uJ16Eakl7jvnixMTGHFB8AblF3
         vOCg==
X-Gm-Message-State: AOJu0Yyy6i6y9/DNHx1jRUGqLekbjPHLZQvDWlX7ZHxENQnZni/B6Xmg
	K9K/0a9ne1/LTfgk2MguANW8FHj5BbXAx+v0ta6/K5ARWRekMYdAAaN0b98ryLEukYI9Mz97/eK
	AT3PJc1OhXCU0vmmylxDHSWQAXdICLbodZVexr40VfHoijeSM3DujwxPJedjdvok823C1KkTC
X-Gm-Gg: ASbGncvaP+tXIlLAUDMkuQ3ZEVDAuWWmyXPJ3+7f7zQRc8H/CglW+OCuwsqS9i8M4s0
	rjnU+wKI7GFaTmQy8CywOnNM5xbsdEPnwLQOEG5aXTp0Lof2jKf5x1Pz+IoKf7IVLxxfKxWmkL5
	R5uvNysRLGzwQ4QNALLSggxgTlAnImVyiVsI5Ba8u2eDcW+WY7cdAOGQnu/ZVyC9BN0+rptT4Zq
	eP0b+RjG1+o91c4MZdOIxJciQcsJGTnJYY2wdEFcgQ0VbvNdfJhe7ikHqIaAMLwlnPNqlej0ed7
	OfceOZDG4ikJHiKqgQQ/GcBViSI88gLnzERjbNIWzVbgztrk
X-Received: by 2002:a17:902:e78c:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-231d459682fmr62471445ad.33.1747424430969;
        Fri, 16 May 2025 12:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7nj1shVFq4kgoN4NQot852pjWMIgCcaeeUronWy/jIPbwjtPa/8IeuqSdRXIhrs+RgKfTdQ==
X-Received: by 2002:a17:902:e78c:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-231d459682fmr62471105ad.33.1747424430578;
        Fri, 16 May 2025 12:40:30 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm17955255ad.147.2025.05.16.12.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:40:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250418064008.7172-1-quic_lingbok@quicinc.com>
References: <20250418064008.7172-1-quic_lingbok@quicinc.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: Abort scan before removing
 link interface to prevent duplicate deletion
Message-Id: <174742443000.3316767.12690800887511642294.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:40:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: x_v3A7nqpO3ewQ2vovGBC79vvfcIDkmL
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=682794af cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qMuIj1eshgUqyd9P3KAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE5MiBTYWx0ZWRfX+rL5cQEIIGx8
 32WqwiKgfF6L5mVkCXjnHUIe0T+hqUxkici/rN0WGjL7bu/sOYq2KynW6MR573FHkVcIPt1B0ID
 N0gDMyrQL7ej1QgKsMmYHzrb4epU+CpUbpL37I2lBAjhBSisKczcTpoSk5ySs1M0Qev/rPGvgfA
 SBN+OtVaAWC+hMYQYbRy/OyTWyv5zg1sgbEDGw90l/zOb9/EQXKrBAQGcP1YPWgRIf4Qgiagg7M
 rucwCCBuOIo0+vxGdqV0PUs6HhfpcldsL/OmfC7A7cmswzh84Lf28I40qsN9kgB44erLcW/ANmS
 8TzOMkIrC1IZrnzESKCjgBjyWqJ5y4/hOL7OGNZYFMc1kSBTim8nAec9f/hlna/TczE3YnCx2IO
 pP73WmWAbgkexTIe+YTUHChO4fw505BcApPdFgqBGLLgyF1B2qFsKJxHYMnpmarHtXqrtZm2
X-Proofpoint-GUID: x_v3A7nqpO3ewQ2vovGBC79vvfcIDkmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=828 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_124032_440124_CDE2458A 
X-CRM114-Status: GOOD (  10.88  )
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


On Fri, 18 Apr 2025 14:40:08 +0800, Lingbo Kong wrote:
> Currently, when ath12k performs the remove link interface operation, if
> there is an ongoing scan operation on the arvif, ath12k may execute the
> remove link interface operation multiple times on the same arvif. This
> occurs because, during the remove link operation, if a scan operation is
> present on the arvif, ath12k may receive a WMI_SCAN_EVENT_COMPLETED event
> from the firmware. Upon receiving this event, ath12k will continue to
> execute the ath12k_scan_vdev_clean_work() function, performing the remove
> link interface operation on the same arvif again.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Abort scan before removing link interface to prevent duplicate deletion
      commit: 1ab2e9046b4f3b298274ad4cc08ff456d3e4274e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


