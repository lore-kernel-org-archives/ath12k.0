Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5A3CAC598
	for <ath12k@archiver.kernel.org>; Wed, 17 Sep 2025 02:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVvSRJYOZy4M0EyZrfl1KA2XhA6LsoUDpQuJsCxvIzs=; b=uns0JRB1hNIzReYVxZVXKfMXUw
	P2idyb9ZqU1Huhl6XE0B8hxYzKLLAFK8XhfPTMY0pQtfwTdIitgLbCpmegXc8cRAGIVvkdz+ed9o/
	g1wBHNIQcX0PCsb3GtWjRPwj52a414cGBrAxftysN4NXAjeTAIPdsII40+60sor63ekJEMBOwWDG8
	ObDcrrFcP1/KrCrlVm54SVoipis/qhAldqOA8KZ6YdAz5aDlOSwt7Z2lVd8nRlMjSH0Ewgaie68ty
	SegAj+WomAwP+XUikEh/LKa2ZldT2h0rEoFJvxqjU0DC/SdNJRObOJ71YCIjambOIWE1kIO2Q0Fzr
	Fv2y6tBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiIq-0000000A17l-3u9u;
	Wed, 17 Sep 2025 02:53:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiIo-0000000A172-1kMh
	for ath12k@lists.infradead.org;
	Wed, 17 Sep 2025 02:53:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLa9Nv025413
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 02:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVvSRJYOZy4M0EyZrfl1KA2XhA6LsoUDpQuJsCxvIzs=; b=fVmjOd1MKyQMfI1b
	QlNDV9+4OYkXc5pOWWICwcfFexPYI8VLhkm01s6R24IYIupMazgqh6CiSWFG6xxL
	k3H/QUGs43rQ8CGHKdD6DoZiKnq4G9gsbvE9xcJTEOAZidLJmbePXHWf9i14dXOo
	tVO5WRH8xUY1mWbVxn7A78uZtWm7729PVjTZA2mx4iUXJned/EmFDrsegBi0nupp
	Vr+docQHH4FirKvunRs2Uoh8VUnwnbQR7w5hBsXW5gi59RsGH9zunAViRUeATXQ9
	kmJNLz1SoJqnPRrEnJwnsSf1ns2FAxX5AMujHAQXrGJ4To0/iFqaT3uhnQ8MyXqk
	ISRezg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwgnmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 02:53:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-267ac96f558so26585625ad.3
        for <ath12k@lists.infradead.org>; Tue, 16 Sep 2025 19:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758077628; x=1758682428;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVvSRJYOZy4M0EyZrfl1KA2XhA6LsoUDpQuJsCxvIzs=;
        b=oZs+WBML6+jokiwjjlgeUvPq+rhmqSRFWN46FCf3u81jm7MDt1Zo0RmyK1ziTPkZ2x
         Q/Vq2ab7qnXxzMY1aMQbDvFiBeKcvGG/j9kzlD31lD7fM4WJDlrRTUqZhi91mp85gyEI
         cN8VEhc1/GZvfPUVo2qz3enXDajzW4oMQG7OFblQ1B3FzQQ0L8/+w7C5JVqmbOuMEqBe
         yL+7Lk0iMi3WNRt+XPSudEVQwmc5dkSEHIjSeS+jD5ac2mPtwOG9ZceQkB/kguevOigv
         gBABKrq2ZFVquR2rOhCSAk99NnqkAYMVVgIBXKqjr+uCuBla02TsirhdT5ovxFy4xhi5
         LA8w==
X-Forwarded-Encrypted: i=1; AJvYcCX0w3nq8FbLdtdCWFySKdQomfo860OiEo+nTrHS+/bp92QZwkg70kJhIeX+wz3ZQKcmGBq/wV0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx53WtoaqasryLCoKZ0p4X/SnZZtzuryK4PZaLBZYssJC9cMoEf
	ywVdC1aSebnpXpvNd6JbImhLEFXxJQAxe0DizZzvADEPFg5DrClbEPgH1/hFlKk2gbzTPSZDUuA
	sPCYIqYGwTFDqRPomSq8xwwBBEUe2ebARoHgg4EBm9vfcTFNQ/ndLR4BGfBQ5P7iA
X-Gm-Gg: ASbGncvEBiCpktiX2Us5uo6DTiREeo5VgE0R3Y7BHljVzqn0ZKqDI4Dbx7im8ndpv3F
	dJaWNEKpNhiYJvXopBJskdKWBKPdwxV8eOXWMhIOxbvc/DAaW0bh3PI+pItRuQ0niU9PlwSiAuh
	LEa9/otHYNR4VJN9LiNUZu/9eMLiFC2KbUeYC5/loz+XPQSO5b7zEJDNL2jWfiuOtkaniCtCkfT
	qPR5EcfKZCnTVunRRkewAru9jclcDKx7aKg+BlbYnf7hSxCQCE/Tfd7VYkaYaWr9ECxWTCs5bQA
	BnP4WYIqIehY565AMKgv5VvFHbxoEiSXY4rebawSWA6FFp+XBGUDc7QOzcmqwutxnuNRu6uLeJM
	aGco9pEuRohxb9ppIDl40niGztnfbDQouQfPHmA==
X-Received: by 2002:a17:903:11cc:b0:262:661d:eb1d with SMTP id d9443c01a7336-268118b9516mr6794375ad.1.1758077627955;
        Tue, 16 Sep 2025 19:53:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz+iCnfeGRJhrk/sCunEeIt1saebIFPgtGbAWqNh6uLgGo3jBEi/jlo5xWg6pe3y86gZRZLA==
X-Received: by 2002:a17:903:11cc:b0:262:661d:eb1d with SMTP id d9443c01a7336-268118b9516mr6794105ad.1.1758077627388;
        Tue, 16 Sep 2025 19:53:47 -0700 (PDT)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2653fcb5b33sm84326225ad.92.2025.09.16.19.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:53:47 -0700 (PDT)
Message-ID: <d1045151-ba85-4412-ac3e-84ee88ac3d91@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:53:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Add fallback for invalid channel
 number in PHY metadata
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>,
        Vinith Kumar R <quic_vinithku@quicinc.com>
References: <20250723190651.699828-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250723190651.699828-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/bC0g4 c=1 sm=1 tr=0 ts=68ca22bd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=FpNJ7K4awL-1w2SDpB0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6kcJHItT_2-mfszZnInGT-d7praKtLal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/8On97R+x3JZ
 mUVQVbRzsyKyYG3YyW+UPeXde0Wfn7TL0TRJbT+lD77jqjHUDZZjk+4brn2vZv03PYfvd6pIDhs
 Plh+D6S55x4wpopSQMMvcK1GhqXFcn9gbjzCQmHq0/kn3KIzi8jmckf/vThZmq2gjEYP+08ZfOD
 JCbCM++EPCEmU8AzMMCXETrND/c3NDdx7WMnHa5Ly7d48H30uvFpZomgEu4hr5CotzEwGKYDxIr
 ygcjRIPY8qi/CbBG6Z0FULRFEj526sZsNNqGeucCmUbyRBXGQKhsRHexDctiu1UtxfPy0CpvP1l
 YsTM3p2oCVn2RfOZugkkCfLXkUjayKDTRr8wJAj8SX6VJrMP4czl1zWkU01WgzkrzvvfP9ncDeP
 oDVCS0Ec
X-Proofpoint-ORIG-GUID: 6kcJHItT_2-mfszZnInGT-d7praKtLal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_195350_605466_F1E4157D 
X-CRM114-Status: GOOD (  22.10  )
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



On 7/24/2025 3:06 AM, Aishwarya R wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Currently, ath12k_dp_rx_h_ppdu() determines the band and frequency
> based on the channel number and center frequency from the RX descriptor's
> PHY metadata. However, in rare cases, it is observed that frequency
> retrieved from the metadata may be invalid or unexpected especially for
> 6 GHz frames.
> This can result in a NULL sband, which prevents proper frequency assignment
> in rx_status and potentially leading to incorrect RX packet classification.
> 
> To fix this potential issue, add a fallback mechanism that uses
> ar->rx_channel to populate the band and frequency when the derived
> sband is invalid or missing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Vinith Kumar R <quic_vinithku@quicinc.com>
> Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 8ab91273592c..adb0cfe109e6 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -2533,6 +2533,8 @@ void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct ath12k_dp_rx_info *rx_info)
>  	channel_num = meta_data;
>  	center_freq = meta_data >> 16;
>  
> +	rx_status->band = NUM_NL80211_BANDS;
> +
>  	if (center_freq >= ATH12K_MIN_6GHZ_FREQ &&
>  	    center_freq <= ATH12K_MAX_6GHZ_FREQ) {
>  		rx_status->band = NL80211_BAND_6GHZ;
> @@ -2541,21 +2543,33 @@ void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct ath12k_dp_rx_info *rx_info)
>  		rx_status->band = NL80211_BAND_2GHZ;
>  	} else if (channel_num >= 36 && channel_num <= 173) {
>  		rx_status->band = NL80211_BAND_5GHZ;
> -	} else {
> +	}
> +
> +	if (unlikely(rx_status->band == NUM_NL80211_BANDS ||
> +		     !ath12k_ar_to_hw(ar)->wiphy->bands[rx_status->band])) {
> +		ath12k_warn(ar->ab, "sband is NULL for status band %d channel_num %d center_freq %d pdev_id %d\n",
> +			    rx_status->band, channel_num, center_freq, ar->pdev_idx);
> +
>  		spin_lock_bh(&ar->data_lock);
>  		channel = ar->rx_channel;
>  		if (channel) {
>  			rx_status->band = channel->band;
>  			channel_num =
>  				ieee80211_frequency_to_channel(channel->center_freq);
> +			rx_status->freq = ieee80211_channel_to_frequency(channel_num,
> +									 rx_status->band);
> +		} else {
> +			ath12k_err(ar->ab, "unable to determine channel, band for rx packet");
>  		}
>  		spin_unlock_bh(&ar->data_lock);
> +		goto h_rate;
>  	}
>  
>  	if (rx_status->band != NL80211_BAND_6GHZ)
>  		rx_status->freq = ieee80211_channel_to_frequency(channel_num,
>  								 rx_status->band);
>  
> +h_rate:
>  	ath12k_dp_rx_h_rate(ar, rx_info);
>  }
> 
> base-commit: 708243c62efde8241e2c66e9c3f377658855149d 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


