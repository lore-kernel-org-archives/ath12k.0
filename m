Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EE1CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/thxqmSGXCGdxA0ka/F92mAeNv7Z/Yh5f4+3MKsC4Es=; b=a85FORPpCeWuAAySzC10uq7YCE
	Com4wcWJ2xrUKiC0ZPBGNbgZnqDfKFtvFtEng4A6FvFEAkYtQk54Lz9k0FZGSiX5p/Ys7ckaS/qnM
	FubryqS/N56CVoCIiRBlaHnkeoj2SluvqIQOefeObg44y/nh7gWlwt9hm5fuitv96FZ//Q13LIlrr
	4h00sdKW3NxdOUwS1ZgJvtN+5JmQEFi/jzU7YvZf59ze5B42ruXuwVkaQV1QMtRn8+8xfEvkif+Tl
	Ll6316kzIZ/OqYS23JOdLP+sdLps+s3Yq8Ts8UevDwcdvYXT2LUBIRkF7O6YiWFTirfN8Y+4bt1CH
	mwHgZckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhwI-00000003fh5-1cIM;
	Thu, 08 Oct 2026 06:49:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhwF-00000003ffq-1ygj
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 06:49:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984CKMV1435328
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 06:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/thxqmSGXCGdxA0ka/F92mAeNv7Z/Yh5f4+3MKsC4Es=; b=Kc6kdFcN81smkTc5
	skQNvg0P4jBmpKtFgj3UYdoG7PF8j4K9I0mNYgd9FDGK9SsaHCpTlX063CSLTcfY
	rTsBJLTroHIUL+yvDjSK/BG1DF4bPMWUpiLo256r2FvBuLNxkg4M/uVZEO76GZOx
	sNdNLiISe+cRJhFLWeBCUdQqeeHsjxah/7kpxa6bxta9bc071wNYE+ceboxqu5zS
	XGMfYsMCswnzJd/4djH2ZZkwkqKRGRrOI2svWGTS2riZB0PnIc40sTuCefyakSUo
	aNUNVpTDvAO5Wvho69fMa9LrzwHtD+i7lJfTgmNLyMx9niy07urjSrcCqGEPrp0A
	cCnHmA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hmm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 06:49:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso52366455ad.3
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442148; x=1792046948; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/thxqmSGXCGdxA0ka/F92mAeNv7Z/Yh5f4+3MKsC4Es=;
        b=Zc7B1zyPOpmRZmC37vPhVdrpDLPgIA/DaTlSL6DkSKlLzyr5R8HkzK2TuIFucndX3o
         NSpdXgZf3wcUdUDNm6UB8E0TJieDIk+944E3M9KJ8jjVcbVOQwvK1cry/rmUh/iWXuY9
         nzcX2/CFPuMLZvSuokDfbguCF8rQIAPjug1Undva5GUC+DWevO72nB/C91AvYWBB/DRx
         SDMF4m4HE0ly899JzEOnRd5L8MRakTJ+ScqrfG3Djvxwm3Sid0o/D9X0/ej4RtFAIy4R
         uVG0jmAps8+h9uVNLA+ZpsOI7k5HRMotEnnPWJQrBpq60GBIUa8uJfG0u28nOr/SWQjG
         SxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442148; x=1792046948;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/thxqmSGXCGdxA0ka/F92mAeNv7Z/Yh5f4+3MKsC4Es=;
        b=K7o99hZ8KgjLQbr9wTHxgLwKfYVZfeZ15NWCMdNM8ckbm01tsdRvSlabYOksIABh2m
         ezIeM5RAIx2J77Ft1U+BkY3MHkDKMtsRRlBZChgE+DLYC5JQeCkyViK61+BwIrA7cCar
         iPyecDQ8DvcZbDC5RTP8ADcG46KwL/0EoCAs/VVrq5owTlKyxSIzCiEBPcvKQ12yQOgU
         D0B9S8Z/hAvpuSJJs0LIh73c51FuRgBUokQ8HX0KL3jXENJ0QagHND5aKpO8jUXQT2oq
         6zg2Ls1b8mJhSIsF4nd9w9SVn/FLNTuTXC+iqV0AXRm2/efckB90m6gWQXXMo7wf6frI
         xI7g==
X-Forwarded-Encrypted: i=1; AKwUvBx3d4Edpg5la3sIIz+qRFJ2I57/g858rYEZF6eVhTJJp4lQOGFDCIh6Ymgmr6FrWjNlF6pw4EE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKFPinIYlUOrB1VI7otMUrKNT2+QRidDJZJQfl+syDiE2bGTqTf
	KE5drE6dpj/+zAsMrumXxXpf0g66Mfuuu0Gx8rQrGqhuQj9wMVfZ7hUrEcTMHNsTEU7ZjG1POMb
	IJ4HdBLzNkbJQ5Vb7/gmvCGxLshoy2/xH8oNy7opFPBvxl0BgfwGNoS7PjNiRO4zt
X-Gm-Gg: AYBFou3FvTxXwqjbaSj9EhuCj8hWzh/r16FJLZ/+shva/VAG35Ov5rH4Osxx8HsfF2s
	xr6HspxUXfY9WUKJS8hlHIwYEQav6r0LSR1Gecybk0VJ827gXhCISCav++rSLmXy9kDq6ckzovM
	mX6yJZxgVQJqj/yLfeVzmA9l+DD+eL3ZwSyFlBtWrqm3NfsIKhrLmHvQgjYBilqX61qlMB6+73m
	sLrSlniWg8thKKAKm279A9FtbdxRAz19cYhcJiff1SLE4EVMA1UaFn0CXLXSTb9DX5/bMYLfu3R
	KoirH2zI4G7yPQsZ45gYvyFUQpJCNrB1AO5Naj/S7jn5G3WiyPeUuVgmJhgrMnhZ07WAgtLCTFK
	lNr29RvhAZg6s8U54a2phuF6SrBQFVRIb2EHr8aSolik6u6psJyIWuaDR89f4POEv4k3yxOCQ
X-Received: by 2002:a17:90b:3b4a:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3a89f674ce1mr3494810a91.4.1791442148482;
        Wed, 07 Oct 2026 23:49:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4a:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3a89f674ce1mr3494804a91.4.1791442148021;
        Wed, 07 Oct 2026 23:49:08 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff8d5896sm2860608a91.12.2026.10.07.23.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:49:06 -0700 (PDT)
Message-ID: <2689b288-05fa-4a51-be5d-c65fdee22ea6@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:49:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: validate MAC/PHY capability count before
 saving
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261003101944.596546-1-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003101944.596546-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXziGQCZqeTukh
 xcI2tR3zasVzsTb3CRy3gJPwDgsmLjvfZGW/Tea28HeSa+/cjGx1QPHFvBGrcjbmPTnBOr+MM3E
 2MUDUce/lfgsAZcoogT+jinxk0Gw794=
X-Proofpoint-ORIG-GUID: 96QwrUrcz-cp-54WUHfM86X-60PzLQWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX7uasB9iY21HX
 4k4l7VQcTNpXEiJkKmp8IflgjMK1LD8fiFh9QqKvXd6hBWU6xxapJC6tmSkGifMYoZ4wcF4x9sT
 9EHD6eUhJMZXZkivBGYIGAfej51T2KHXYzeX3EzuY+iWx2BFIIcK8H7oFpylH6TMxB1u6XY7BBn
 JsIpERRXbriPY/GeHLMWzWuzR/CK1OHt5jw6355HL36HYjEaAEj9TzMWyMB13HnFLCKH7JQgJmS
 wCnk5AYUbmwAJnma0zqsL4JFpTt4D74RJQxJA28KMEVAaEUFUea5eJPwZ+nQAEiJdxBHB5Dh730
 75nhHD0mSCrY5bzu2HX/WXcce8B601e0pW717exFvvgHjnZ5xbKgGL+cJrPffN8qJSrVaOvZNtS
 kjMq/y7Vpbj3uAsJj0aBJjRn9rPFkpHIGUh7UWd21UQQkC6cXMoqNVs+y1LkaF9053tIpLtCjIj
 HGqH2Z5SlHbz8l2E5OA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac73ce5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=CgAF95LDYrE-zO_MwBMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 96QwrUrcz-cp-54WUHfM86X-60PzLQWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234911_634638_219117EB 
X-CRM114-Status: GOOD (  10.98  )
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



On 10/3/2026 6:19 PM, Jiale Yao wrote:
> Firmware supplies the hardware mode count and the PHY bitmap for each
> mode in the service-ready-ext event. ath12k_wmi_save_all_mac_phy_info()
> uses those bitmaps to populate svc_ext_info->mac_phy_info, but the
> destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.
> 
> If the total number of advertised PHY entries exceeds that limit, the
> loop writes beyond mac_phy_info and corrupts adjacent memory.
> 
> ath12k_wmi_mac_phy_caps_parse() allocates the source array for
> tot_phy_id entries and rejects excess capability TLVs. However, if the
> event contains fewer capability TLVs than advertised, the remaining
> allocated entries stay zeroed and are saved as invalid PHY information.
> 
> After parsing the MAC/PHY capability TLVs, validate the destination
> capacity and reject an incomplete capability list before saving any
> entries.
> 
> Fixes: 062ade23991e ("wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

