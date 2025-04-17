Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E052C369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pexxP1BldCAQGLWFjmCHmMyENzgBZNbzttjY9v6BE9c=; b=sbmSAE4FIyPgqC7HGMAm8jOfPx
	LQIM1UX+FIh22YINQZTvkN0V9R40+LTYxeqMXtKtYSHviYjcApMXuvTZTSg9swO7sz6MSlMmlTMqR
	NXG+0AloybenOHYTSGgwayclHJZneZO0cTIkiJ4Rr9HsWJLwpK+fKnLNduia2RzVEf1k67Maf3NJK
	018e8KQdKONGGjmdKjdXhE/+5Mn3PUvl1TuOYWHUEkWjQW5z1noP6cruQfpbIgZKG/sPnyLqYYUEK
	8kirL6UwQrcuFDbU7mqKl5CYHqHbRj1R9OKWyWHj+kkvyi1hUIR2/GFNbdB9i+AMAOIym3P15OqhY
	gUdz92qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5H4Z-0000000BhMc-1KB3;
	Thu, 17 Apr 2025 04:41:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5H4X-0000000BhMI-042g
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:41:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GN6kWX029930
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pexxP1BldCAQGLWFjmCHmMyENzgBZNbzttjY9v6BE9c=; b=mmHpJdI7H1xnsZ41
	VATn+urJPX0vXBv/b/QCIfOCDsTUIux5iFrHd6yOvm8Ek2xbTDACU2BGulUay5lR
	aPj+kj31YbD/6i9eQFRvUl4kcdZE3Y3dIoXTniXnTgthZKqaF0LURN9qQHDOW3wG
	QYZ98RgZeS1zS54WP98TDUge/WWZOzvfezDqBUzT3vihO/3I45Nwg0Yh7rcsfMmQ
	rKuPdyTdnJwR9cOxUohqa1g7KtKqcWJMiq0GeK9QlnQ5lHUF4jXroX1bT/kWLPll
	JfmsmhUO9ERXgb9ukmQ1NUI6Lyw2Xv1InCsgwKHZBIOjDeTMLvt2xBm14/KfdF3g
	7KZDGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk5hn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:41:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2254bdd4982so7302205ad.1
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 21:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864914; x=1745469714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pexxP1BldCAQGLWFjmCHmMyENzgBZNbzttjY9v6BE9c=;
        b=HuumHfJonhid5IirYZBBwRyVOpFLKjRFgGdYwF5S90lSoyQnDexOHGIAaHhvDn6Pn6
         cxMjAOAJwn2XCA8iGuyYIWVnqQk4lLlfvdFBlvn8lFpMSTcQqAVWykd8mLJv0ec5Pc9X
         +Sz21Y/0AvRC6z4ajw5y75an4MbY0NKrv1Hhg6Vc/wZk5nd+2SY1SbNPntLx5lF7oz3K
         ASZIbvZmMGIpP7YMKyvLSky7PyWjq5LFdRBIGXtzLaNI9DhxCH4IxMh8sN1i4Cc7WOa6
         V0ofpBwK4+TCDaxUApWDO7t7dnt8n4ep8VUMMxSyM78wsJSeFpX5VBRkpCGCteAWQTZx
         iSRA==
X-Forwarded-Encrypted: i=1; AJvYcCUD31NHnaOH0b2ERA2kH75h+1FCh+kx1PzN6gwGbmCIgNEIhtJcZHEqHnYHJGMA4qYRj+lL6dQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAvC7kTZ1Tt9whe8Hv87bEAxo7G6Hdklwq/FSmkScIixeg1Qgf
	R9X1DhKaOT7/2uEvdMy4BlmEjRoFniHdOoTUB0nejufPbifwCTphPycD52Im4pX7jo4x3EioSNH
	/VJUyENijP4mka0Wrx0xtERbKfGcIdgo01LV7pZZM7cGyBEjjS5UoB24Sp3E2
X-Gm-Gg: ASbGncsnlrAr389tokdgL0Gl5WPu5uEhzAC5QFqRqp1R+0TWvuZqgSKA2yMXpeS6iAR
	pn9dd+WayDkPz29XkYVWveHPNBbReAPIYRQVN13Qt1Z1RGOqB4hoZuPUmmWxaCZgs2dwp0+sRVy
	Q5liixWzWr2VDiiUXQeSo9f/66XiGe9ICJOykHaW+cQHAIoivy9oITLGGDwQYdLx9p6I9zUNomD
	llJ23jwAMEC9FFyzESuvuxoXSbDuT315HNn9z9sNKdh78AfpvUchicNg9ogneAVwQ24V8aAbsMl
	CoWXF4vbaysBJWuYnEYo+g/P2CJx+r7T/YcAfBBlrMfBA4CjUHUJrA==
X-Received: by 2002:a17:903:3d06:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22c3596beebmr80397255ad.32.1744864913907;
        Wed, 16 Apr 2025 21:41:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnxgABVyQ+50teya7J1uDHzzYjq9CTMyzfTfNU4Iltl7W9rxvuxC8y27LNLZZzC36uigpoDQ==
X-Received: by 2002:a17:903:3d06:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22c3596beebmr80396925ad.32.1744864913380;
        Wed, 16 Apr 2025 21:41:53 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11c7sm23564205ad.37.2025.04.16.21.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:41:53 -0700 (PDT)
Message-ID: <9f619ba1-b29d-e1a3-b286-089047fd476e@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:11:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add MSDU length validation for
 tkip mic error error
Content-Language: en-US
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
References: <20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68008692 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fAuNF8LVcKM9mBkeKYMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -BHBd_YN1MO-dkOF1ZVwxJx_yhMWXVTW
X-Proofpoint-ORIG-GUID: -BHBd_YN1MO-dkOF1ZVwxJx_yhMWXVTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=804 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_214157_083119_1D5B1FD3 
X-CRM114-Status: UNSURE (   9.22  )
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



On 4/16/2025 7:49 AM, Nithyanantham Paramasivam wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> In the WBM error path, while processing TKIP MIC errors, MSDU length
> is fetched from the hal_rx_desc's msdu_end. This MSDU length is
> directly passed to skb_put without validation. In stress test
> scenarios, the WBM error ring may receive invalid descriptors, which
> could lead to an invalid MSDU length.
> 
> To fix this, add a check to drop the skb when the calculated MSDU
> length is greater than the skb size.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

