Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D48CC531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 04:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZB1dUbaHZf6gE20F5i86eXcCl8V1AJSd3jw+FthmqI=; b=YtMSI5Zx1FWHSWKWbm8ej+lU+u
	IMikWC3zfqOeiIoTt+RDngB19DbWbMJOVqlSv2Xt2JwpqlG/LDKOJWiyUATOqxTKaycEY3gpvD0K/
	8TAO7kjgWu7rECbrxtpuWzuqilbfV0EC4S6g6xv0vRpbcHaVJwB72fbMPdh6gqgoJXNRdyjFSmjaj
	0XHghnR6cmL2o0lovV1/mMMfSBDq6iRlRE/zIYslePgjRih92gIRHTbr8/XfyqOHhcGkEEZXZzBj3
	YU/Ie46rYi2+eHgJ6Mmz2y18/inGKtvrfdbj08DCvIJd6KyNh2mYD0oxi3s7dC6CzaZ4G7whQi1aH
	CXeUTmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDJf-00000001wo1-2qQZ;
	Mon, 27 Jul 2026 04:51:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDJd-00000001wnb-16h2
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 04:51:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g3Jl2467067
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 04:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZB1dUbaHZf6gE20F5i86eXcCl8V1AJSd3jw+FthmqI=; b=BedZRv1kfTb8UVRt
	hjShLshwhefzBrslg/qHufOfGGx26oJnDwNtHNzJIe1uBlsRMKZn5koMcWxlOr4e
	TFxqswPJrYBMJxLZ9yWhgieZQXeluWj2QIsV+Jdk8hIvlPduWvvzz7GF8WrL7Zpz
	eVrvofCjGUTjK3e/ZCEAXCppBAHNiyW5sDCRX/J6v+htWnGrt9KqEC/b9Iyl/t61
	YusjB22Lq3p9o1bnGZcKzRbI5xP28fZajtKFSPtz5lwfI5Grb2lVRYTXSNEcZY+D
	g701jX3PQ/tHgaaTK3ZM7a54PRsVRBfx2yItc7m4L3qk3TNx45xwcpwtl6qfnlun
	oDk0ww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574qg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 04:51:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1447210a12.3
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 21:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127905; x=1785732705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZB1dUbaHZf6gE20F5i86eXcCl8V1AJSd3jw+FthmqI=;
        b=YRx5I6tr5ifhZq/GfCS9K5WjmBJhVdwYraMGDBbxPNtDctGRlBnURNwmtyXGX91NlJ
         yl27ri6j20HhKU0q0w7sFYRrzmoK5d3eWdcHx0RZz4jjRffr58UyhME5SXgcS/dlBUPR
         5ppwKhdgWMfAa09Cmw2IAseahQw96iRcGgNpWU9xCIsM8t4RoQN1U/YMu3UaeNA9mbrj
         Vo2A+NNdVZKwkPVWUZ/zOrvkNtmIdp+XKECvnRf4PylFFDvbFGaYAMKkqs6oScPRy5QL
         z4Fn9+WWxhSOMEfCutdZpUA7felMIgwNYUARmxA3urYAJzjJvFVQjFz14u3qp75/Khep
         V3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127905; x=1785732705;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZB1dUbaHZf6gE20F5i86eXcCl8V1AJSd3jw+FthmqI=;
        b=pl7fRrBnlcdd3HlGZWkV9DfFvk2VqX8gg7mvAN/NAET1vT9NiREoFpkryXjrR9oHBD
         j7u1oF1F4UDNvsnr+aPa1Rl3Ea2RfELr36z2V77/nwGANwocHe7xu6rjhrTE889ua/Ty
         /F4dnAJMX+vEk26fOyB+InIYJuXGwG8mNludvJJVrWgkWAd9vC86QSDRGMWxMDkzOS4L
         bSHUhWHaOyiygzmqwstk0RFayhob41tuTD29BSysLQ3ey3eawJdmwlx2d3XCRpTOASJW
         77QDz+hWm3jXN/ZFWQ8JzEWc/9OZ9xYoyYVYhD8WVTs//rQrAkPEUektcxtDcSs0LTLX
         GSOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaMK5T6pdJ86b/sZ1zBjK7/j/iQhZZXGF19EPL5OTHBEhhTccJfhfd+AAGuaXcDa+umJOyepI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFdqmigQ3d+3d+xQlthCBxvoccxqAvRkAKp6o2jW7MuMUlq3rJ
	mLF6yG3B/G2ObFqVT1y96AhhiP81Gi6rM/HNEumrfJ+T6qYuSZ7F4uIXEJwmsXbo3wZfaPb33KA
	/SA1HgOIDZ3DYVog/IIXLojD1HQOrveGoPd309StZT+p8yoG1XMDYjkbk8IjvLLyo
X-Gm-Gg: AR+sD10jVS4hQ2x2zTmbRygstflgdaBU10XM9L6rt+VQwLEmWoN0T1hVpZ5YMjvTB70
	8ivrjXwDJRoXly13E1m+cbPeYbaOiKBDzW7pNQ9LtuO3p3B6oGsdnrjCSQpdTKk60hXTUqJbFhr
	9xuRxDI8fx/ao+IEBhJWYg8ZeK1r2b8vFYKke+whF1+5o5jZ0ni/7ZwmFlqw2Q7/TYZyh4t/fX4
	CLVaGMwE1GBRw8t+XLCV0pND283myX4aOCZNMpCoM5W3wV0qqyuG0HOJ8LPcipSZqJa1kIM0AfA
	1jC1LllmM/O9LV6QJcDwQ6hN1THvdwCElgd1my26KqG/MzCa8/YU9P7YYZpdXXjETtBVXBEFfFX
	v0Yy/wWdqSyHOBAqorYQ2P4XI0LQL4vtRoy+ZVQ4f
X-Received: by 2002:a05:6300:86:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c67e027636mr6609041637.76.1785127905562;
        Sun, 26 Jul 2026 21:51:45 -0700 (PDT)
X-Received: by 2002:a05:6300:86:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c67e027636mr6609027637.76.1785127905109;
        Sun, 26 Jul 2026 21:51:45 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm43520981eec.2.2026.07.26.21.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:51:44 -0700 (PDT)
Message-ID: <a4074061-0097-4baf-b11c-a265c7f30849@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:21:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Use different RX release ring
 sizes as per memory profiles
To: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260721110459.2203038-1-pavankumar.nandeshwar@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721110459.2203038-1-pavankumar.nandeshwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0NSBTYWx0ZWRfX2r3enRfwmU7D
 FKE3nLq61eJ14TwkTcUPrpVL8RGehefbYFpZejU5ut9EDKh7AvhAsVfFdyOqAoDgfn0Tbau+GiV
 TNxd3bNrt9Q4/7NhdYDF7mrBhIa7Qfw=
X-Proofpoint-GUID: 9oCwZwu2CbheeGun9lQXxyOce7-J647r
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66e3e2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=32pKNZ-c1SNXjFBoJ0UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 9oCwZwu2CbheeGun9lQXxyOce7-J647r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0NSBTYWx0ZWRfX7wy8QhavMUvV
 MsmN3mdsh9+A9zlVvzwk590PRDK9sICumA30cW3+mokRg2uD5/NXpxxBTet40G8iQGOIhUOYkwF
 SL/E5bmAJ38kqMWW1xQkcKw9iLQ+S72VZkNq3NcD+qss62owr5OhjJ6GKCLJ8cAZ9Bsi2HePmTe
 UT4Mz3ZqxT1xWEnpRoRUY2CAB5ymH/1WqALwZ7CAVfnunyLeHssDbrHcv/HWI5Yuw+yCg02HDgG
 OsiLj3GG/dXvTIWUVu79cpeKQlR7ThP4X+L6ZSR1hi7cTI/NjH8rs5iQvA8QC53qTvBDcO5Iaow
 7zqQDXpwSlgooIJy5GoNFOv2ud2mY8jgybHyvlq6WvQYP0zscqqTCTiz2eM1b/kmCVfzVSVUOlu
 hSwLn2kXwexm4Q23zoaTwx8v5tdf/YY32+8gMe9K6GS7LqFIQAoEzYSUxfYbH7Xr46i+uDpThLm
 A3EDByne+K6jiIT9SJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_215149_490068_4FBC39FD 
X-CRM114-Status: GOOD (  12.90  )
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

On 7/21/2026 4:34 PM, Pavankumar Nandeshwar wrote:
> Currently, the RX release ring size is hardcoded to 1024 entries via
> DP_RX_RELEASE_RING_SIZE. This value was sufficient for older generations,
> but is not adequate for Wi-Fi 7 scenarios with higher aggregation,
> parallel processing, and increased likelihood of error bursts.
> 
> In Wi-Fi 7, a PPDU can carry up to 1024 MPDUs and each MPDU may contain
> multiple MSDUs. In error scenarios such as REO out-of-order (OOR) events,
> a large number of MSDUs can be pushed to the RX release ring in a short
> duration. With multiple PPDUs being processed in parallel (e.g. multi-core
> or MLO scenarios), this can lead to significant bursts of descriptors.
> 
> Field observations have shown frequent OOR conditions and back-pressure
> issues with smaller ring sizes. Increasing the RX release ring size helps
> absorb these bursts and avoids back-pressure in the RXDMA/REO pipeline.
> Without sufficient ring capacity (e.g. 16K), back-pressure was observed
> under stress conditions.
> 
> To address this, make the RX release ring size configurable per memory
> profile by adding rx_release_ring_size to ath12k_dp_profile_params:
> 
> - Default memory profile: 16384 entries
> - Low memory profile (512M): 8192 entries
> 
> The larger size in the default profile improves robustness under high
> traffic and error conditions by reducing the probability of ring overflow
> and pipeline stalls. The reduced size in the low memory profile balances
> memory usage while still providing sufficient headroom compared to the
> previous fixed value.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

