Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17C4C7EE30
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CF3WGzhE+aCOxzpXb8QO3q3tol1cNtQp1vp+qcU6LNc=; b=XNtaMa2OmenIbWti2HZSYlGkMd
	4DyHj04ISGG4/2sWxtbMP1wWaqrP/e72LOsgovUfAKWr/UUyOD2AoqtD+FZ0VvBN0WTTRmRRGlwP4
	YQrpNKdgriUmFshe6NkMCeOepVmV1uqJtN5htb9B1VheQozHsjudk/19ZFHxcC+wgVLFRNzpIrQJ9
	ikqPFrjdOo/Zmibrg06ptcG8pQ0T82P5mnQip07PEUUAHne0hmpC/5lHVi2p9Nyg8K3UPHcQT3Nno
	rXAFOV7fmgifxCj2bDRqFqOns8Hd3enZYs1UE1Al4PmjdFnbnkEpWV/MnQreqeIrvPoxyqoTyeJ1b
	gi/aMLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpyc-0000000CKtW-2omk;
	Thu, 26 Jun 2025 17:01:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpyZ-0000000CKt8-3Z39
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 17:01:28 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9N28x029548
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 17:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CF3WGzhE+aCOxzpXb8QO3q3tol1cNtQp1vp+qcU6LNc=; b=faIyVdJB75ifZji7
	lbGf14agWJm2nRxVllGH5IcZ3X2Kjvx2IIDoQZRwbFO7JFK7aBkF7dS4ukxUaWkl
	SC/vBA/gNCMlI1ag1PyCeYR7/3yEoQewzrBgr5ehTt6krfdPoqT6rPXap1X+SC10
	IcOSDn+kVPOq+BMf7Av7ITevNVrpbfxcBTb2rwCfUxpCzKoI4g+oY5OqD77lsQGS
	6T2seFU01EngZD07aWVVytwNyEEPpBLOFVlBAEhImB6jC44QPaX5/2M9oqjH8kqu
	FXfMY+1WVt+nkXN9m0x6d/UZlVrdz+tlX1oVaOVF/036Fw+F/Qgm3PO94gNEnrdK
	cRXsUw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4wbse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 17:01:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2f103f6074so785858a12.3
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 10:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957286; x=1751562086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CF3WGzhE+aCOxzpXb8QO3q3tol1cNtQp1vp+qcU6LNc=;
        b=eMIpztSFki9TCdpCaOyvXv4Y2OxBWQctXNEfQ+f+uLmLvn8j7mn4aiihyGL+ACVWV0
         9fuBE9P9CctrH0Kfo0dR7UZ+yN+UyY89ZwfmgJuNczlk3LQrzCmOQxBTi7rYO1feuEZX
         DgGJ7GJr0npADMLgKXld+rMuHVJRgewUZCTh7MT63k+7U5g+OP2tRoOH0rtdrr7x+8P9
         tNc8871TvJyZ2pY9NA1LuN5yrMSrT6ChE2G4A+Vrv7rKA//3rqU4l1a2AVWL1Zt6GhfO
         nxvQZsqF8okO9rfaGTVS1TcLCBCTOCOcecoQ4OEWGZBGiz+0P1tTgRaKR0bpJplQDcAt
         0MqA==
X-Forwarded-Encrypted: i=1; AJvYcCU+FXh163gP+Nbpk1zyjh/P/pT7ExN/hX3gqSwS311Fk3TbvWktuZscggCImARLWc18jn1V904=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFw8CSsCe02Wxn0cTNFwLwhaLdFz2+FxP6oHIHLS+R9HPzbYqD
	VyhXrLOeT3+m2KuWfl9tr8qajGgF+v43R23rNh1Ff+3ZFe4ZODQa5fWgpAIsRjnoaMhOp59ZA7D
	ssqXL5Fuo+doOx6BJ9E/1nS3Zjv9irtIveorYPKETdJxvIl0PeZm4ydaET05T/euw
X-Gm-Gg: ASbGncvkuTPL/FHufi64E6qPiQbd6B25oMLWxnSfMPhX27QaStFVFrlE/rGZmSV73Pv
	Ru1Mj+z99Je7ImvCi0XPPiWcB07+Bn20kjSh58jJ7X46+w/CAqUvsUiQEVaUBbt0We/y6+Iqjdf
	ZRvTW9LmLF0WjfEkElxROT3iKbAOolSFc80jEzJiQq/no8U9v4oZlgb4yLSN4L0WRVMfKjLIb9N
	HPBDg5ZAXeyi04no6luk9u7Q7QYa+7mxtkREpd1D42vfo877dhgWAPSDKGNehdZRSyb8S+iqQzA
	pVNuAMssnqfvR97phNRPU8U1IiCal/Fltm/CgNU/EWMCMvy2/HDpg1QTZ7S5rZK9EjAB/yo=
X-Received: by 2002:a17:902:e54b:b0:234:9068:ed99 with SMTP id d9443c01a7336-23ac468217cmr676365ad.24.1750957285886;
        Thu, 26 Jun 2025 10:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6zvnpbhFjoE8MY0MbGluoHDEzdXqP7vAxIz1miQ05PBrQaeoc1+PwDSFkBzn09LhcY+DT+A==
X-Received: by 2002:a17:902:e54b:b0:234:9068:ed99 with SMTP id d9443c01a7336-23ac468217cmr674475ad.24.1750957284149;
        Thu, 26 Jun 2025 10:01:24 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe430ba2sm2342015ad.207.2025.06.26.10.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:01:23 -0700 (PDT)
Message-ID: <c10cdc33-14ad-abb0-1765-2f27dee55595@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:31:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix station association with
 Non-TX BSS
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d7ce7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5MRXV6a3SOdtvRoyAP8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: n0jWGwTsDgn1GGi-Yha5AHkFw8BvvMUF
X-Proofpoint-ORIG-GUID: n0jWGwTsDgn1GGi-Yha5AHkFw8BvvMUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0NSBTYWx0ZWRfX/jgiMdDgEhvX
 CrMOjzbzaSNcYdXlqZruPWp2nwiTpj2MNXF27tDELY5bLvcOhZDPETtOi8+O3Mn61vR8C5mhNyg
 Oie/deZp3fXSWtMgpeiDL8bvlNsWc2lysfS5KLZMf7taRFIrsdqWjv2POlLckXPvI0zpDjpIj1v
 dYG3GsRIvuDP8WsHpFP/l1WhG65uMnLeg5WQH+0Wm+vZtvdRZk1RsquHnSIdAc848E2zt5C09Gi
 7hzsSpDL7DQ4veJ9mSqCahQGlv4IikdVM69WOVxdt9/a3vvB0G3c/6ao4W863oqik1Xvg8CW1Y2
 19i29SYlwafPUtxIWOTiOm1yck5QkmcP9VrFSSH0g4xU7MbJKjSnTsxqhpgsOA9k4ufcu4aRxTk
 KtA7JOLtJsYblsfE1n3zqzj34Pnmb4Ere2/pVaLLpuNN/5ZriDD3/E4JfOuRJy6Sc7+yoMwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=831
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_100127_898331_2CD053DF 
X-CRM114-Status: GOOD (  10.99  )
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



On 5/30/2025 9:26 AM, Rameshkumar Sundaram wrote:
> Currently, ath12k Station fails to associate to non-transmitting BSS of a
> Multiple BSS set as the scan results from mac80211 does not have
> information about the non-transmitting BSSes. Fix this by advertising
> driver's MBSSID capability.
> Also once STA associates to a Non-Transmitted BSS, instruct the firmware
> to keep track the Non-Tx Profile's presence in the MBSSID beacon
> transmitted by the Transmitting BSS.
> 
> Hari Chandrakanthan (1):
>    wifi: ath12k: Fix station association with MBSSID Non-TX BSS
> 
> Rameshkumar Sundaram (1):
>    wifi: ath12k: Fix beacon reception for sta associated to Non-TX AP
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 57 ++++++++++++++++++---------
>   1 file changed, 38 insertions(+), 19 deletions(-)
> 
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

