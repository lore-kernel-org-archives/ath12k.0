Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCE7C369AB
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwIniLDOmXdB4HFP1nlmjOgcHAoV2syQICs3/r7G9h0=; b=fHiyw7eFoCPKKezzH0PRE6TGkn
	tfmsLMRYCIb2o3c35FPqx0mobkPvxcI8MVW4HjpdfqpG91TFXDA7QpO/GOJ1jfNmjWqbmNmcbX33G
	CZaJ6ax1savrhLNTj+QcsDEhrR9NpCjKZe74t0pxdVWUXlt0QZ5TV1Rx4bDV0G95vAdpWQBr+Abmc
	eseYg52/nxbopAFUwQHyTRJbmobG3l+yyawbJLDXld32A8N8WW1e5RDPfwQorJ/EFdQnz2EZZJ3Wh
	huoKtCN0v4/CPxZ9ybHV9/vUkaAsu4O16p809zIiAGeEgIykVFh+WHREwBg9EbBrD63JKF4KdlgkT
	MRTwQiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4l-0000000EcVD-361a;
	Thu, 24 Apr 2025 16:05:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xGI-0000000EK2I-1jES
	for ath12k@bombadil.infradead.org;
	Thu, 24 Apr 2025 14:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HwIniLDOmXdB4HFP1nlmjOgcHAoV2syQICs3/r7G9h0=; b=TAYineIZJlNd26mVUsedp+kM0L
	4b/fOoiQ3e4cxrXl/pgitQa431eeKgO98TUXYDYAwvlZ23HUZEXjhJPcQcUStW60yol9Mc/uihx1G
	ZR5+ue/dP57GkKqNUvsGlbkcyKQGYfgKNJAqnsRMeqRMwCZ+EiUTQHl9bBoAmMuIP/5QovmFDtVzG
	GanV1M88/lztCiSujELIcSkd390mzpJjr+HekFwreCvW6ZTpZieTX18uYMN+540Lgrr4ODrge4ByR
	A9c95UvPRUvDNmpGI4a9P4Ksb/b1DVOj+/Fk1B5LlNOCnOpAGKAd9rVo9gchwMTueAwpIx9aItAdi
	2MTAB96Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7xGF-0000000BpU9-12TC
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 14:09:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3CgI007200
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 14:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwIniLDOmXdB4HFP1nlmjOgcHAoV2syQICs3/r7G9h0=; b=nwnUJDqWPWOdATjt
	ySzLpJS6fn6nQ52QFJ75ozmTLQ1vNNcOHFe2/9dK1K9sSjCuk5OmQFo47Lt3MmHm
	0VrdS+RbiimfFO/Ve28owVraMUVpXn7y/FhMhDnMxNnIpz0LUQbFFIViXqBuYsf+
	xd6JDpXskS3C3otSF+SnE6x3EnhCCrqKpBR0quKN2X/Ut9cYn92TfgxavnTWFF++
	5MNFlgFnvrBI4+JEBN3idow8D3kO359pcIwpMDXzUfv/D3VXtsEXHYyeyE2yC/KJ
	x5fZ+7BbNPvBXkwVvzxtcm8lAFQ3066j5kbPBntt5wX51QshP/eVzdCAsfQrzYac
	txATSQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ns06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 14:09:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso615740b3a.0
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503740; x=1746108540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwIniLDOmXdB4HFP1nlmjOgcHAoV2syQICs3/r7G9h0=;
        b=Yv1XlExYFK2V3NCNAmPSvFRQmnHA66rlnUgPtXDBzEwv8rUl9BzmMcFAjyLBjAOhL+
         xwmaCNEGq8soFXymccHongDeU5tUVac36Cs8XI2xzfXbngu8zG3dFWVmnc1YX86GUqXi
         IscaFp0Jsud7yHnOdU8pGSJkr/Qi03X+zIHk2Yh8S2vIO9KSEfX+SMo4EieQlvl6Ewq3
         RIPxqm34X0HNuW+ngdLQ4CuE4ZLLcG8HN50CxtfNSZIY2iIM/z6glxTeNuh5JQeEDlIl
         nfbk3d1PNS2h3aidrO8GJbIPj5Z0/jYPXEeUEQWlU2PT66XrAX/3DgP6aQxAMFsQk7TD
         xLlg==
X-Forwarded-Encrypted: i=1; AJvYcCWcQHZZavgTyIWirkNfWlOmPj27FBiBlqs/zJhmQnu8mFS6dQZYHNFsYPMZWCKyC7NYspPslYE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLf0eJNdeVSbRb3U2MGVpdh1FXpZ3KPg+3IeUs/I+Oi+HWfNxj
	DPWRgpdSOc/l5QAEigdTAuKoI8h8T8m3wh8XDn7/SWI09I0czBBEwkJ39P1TTxhg6yw5s789LED
	TREZrRFbvRKMjDaMNw3XipLMu+mUTlqO27IN4Swp55B61zngoQbEqU5B6YeBIDtBEK1qC
X-Gm-Gg: ASbGncv57s+qkRscDUfYop9Gj3xusEBH8qUii+OfU4Eft3JtXcEVBIU3WJWBAlSVHnn
	96nvT81Y/Q+8L3lVwm7w4Yq9sJKtMB4EcRG5lXKmONo9//2DGhL8fGrd0hkw/cm96Bc8b5eK796
	5ZiqWtv8d4+witbEUY5Gq3aGMXKiiOqVQHznp/GLB9fIJOYQua7QziWs83K0s1rPs2B5+hnnnnv
	dQH8NOmaj7YjIQr7dawjKeRxGASmpxiWvu8K8cWrkgvGIBut15VP/18Sj+qWj/Ygp6/CEacHcad
	ZYiXrz4rTaNk/4oNIOG9vYcxyCqdr2AmDHdg5V58IcxUID5p9ZweRED5DYOoMufKTbS/dE9QwPS
	vBKgm
X-Received: by 2002:a05:6a20:d50c:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-20444f089b8mr3593085637.21.1745503740516;
        Thu, 24 Apr 2025 07:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYUAeajIB0jdH2f5aDrV3SkJUkmeeYgbA/prjSE15XVhCi/dQWNidKZ7igvy3slS+uYDvmug==
X-Received: by 2002:a05:6a20:d50c:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-20444f089b8mr3593045637.21.1745503740076;
        Thu, 24 Apr 2025 07:09:00 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259134casm1470698b3a.11.2025.04.24.07.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 07:08:59 -0700 (PDT)
Message-ID: <d2e6a1e9-7831-4342-9458-4628f9cf7182@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 07:08:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Prevent multicast duplication for
 dynamic VLAN
To: Muna Sinada <muna.sinada@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250310230105.3534334-1-muna.sinada@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250310230105.3534334-1-muna.sinada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NSbMVi-ET2cioGKfeMTIjaPmUhCJZqZK
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a45fe cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=zGDnsRbxjYQ8UK2HgisA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NSbMVi-ET2cioGKfeMTIjaPmUhCJZqZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5NSBTYWx0ZWRfX5ZU1p4+gJa88 K8ttBtt03QvlVy+eZc+kgK6GMFpnjwIF6VlufDX928Y756akRASLj4FS0bfh8d9345/MZfxFbIm afbGvHlpWJ3yDiD8zqJ4eyYKmOQWyEuUET46Oq0w7+FQTNSRQz2TSMUB5bVxqjaywOogWn1P46r
 Cta2ozKJLPDMOB99I46EGsjKC67dcr3bbKOJwGWNb7LGtfC6e0zNCFt9+CGv3k5/JOTb0LrO7a6 OMwSYDnG9WookQj8Yr6YCBu+069mu9GapwP8xLNeJC95i4E4jbOfeT623ZV+LrBdhK+/b5e5Ri2 nPNkPWnzTmUvb3Ir+akNOYUq1m35Xeowsi9hMrA1vGDAAhqRFQpenALlZ731IruD3IjWBZ9Q5g3
 BftHURQgY/nBFhSzEBH4z6kftHhhhP8RyEATxTAEAFrnUL5oR2db6rawqKQ8/TP0+VPtc+Xm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=594 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_150907_666073_56B0B6F3 
X-CRM114-Status: GOOD (  11.90  )
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

On 3/10/2025 4:01 PM, Muna Sinada wrote:
> Since dynamic VLAN traffic is software encrypted and encapsulated,
> mac80211 handles the duplication on each link for MLO dynamic VLAN
> multicast.
> 
> Currently in mac Tx op, all multicast frames are duplicated and are

Let's s/mac Tx op/ath12k_mac_op_tx()/ to be very specific where this is happening.

> assigned a mcbc_gsn. This is causing dynamic VLAN multicast traffic
> to be dropped in HW.

preference is to s/HW/hardware/

> 
> Prevent dynamic VLAN multicast traffic from being duplicated again in
> the driver. Check if incoming packet is a dynamic VLAN packet and
> avoid defaulting to multicast conditional.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>

Don't spin a new version just to address those comments.

I can make them when I put the patch in the 'pending' branch if there are no
further review comments.

/jeff


