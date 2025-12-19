Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC4CD7494F
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 05:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2jVuL0Bz+ej9c5464E/vN6YXCzWpbQDOG1kB6pWIUc=; b=ZycUi6Jk1oD4THZgrHebaI/Orw
	JJ+KI0ipd0vI03NjuY3P/HkobGCay37HvLnDCj1utV/FBtFDTqJtr1wt2rgfcQ2fYmgAF1Ad/WVGj
	ysfk+G3dawF3fafNu5TL15JBlCIuytu+4czMzqCRUbzBlX9iP3FLg/u5zWf9hymkpkMZ2uWoCOxNB
	EHcxgBrEJK66QuYoM3AIC7Yyn4qf6iJf8tbKE9d5ZO4d0ZyUOMnk/85gaqMmyd+Av/KGuJC/C97VR
	/YgH5vyBIEjuch87JKZ+sRMf5Mo9dGBtm40i0n5x6RHMfYduRrO706vmqkJY4gysdfErtf59NZrHk
	GPlYNE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWSyM-00000009e2h-45St;
	Fri, 19 Dec 2025 05:24:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWSyK-00000009e2K-1oX1
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 05:24:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cN6N3700872
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 05:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2jVuL0Bz+ej9c5464E/vN6YXCzWpbQDOG1kB6pWIUc=; b=EVK5U2xd7w11dyD9
	m/EcxE1g2aA+CkfA6DrSB+28WD6CxIV/vKTeizav5ySWxuTtDwhJIBkTx5rmJRtd
	myu1sBu3cW+l/V5MPLIeQ3KkVT8z0nOadR71w5hfYrqpc6I2yqIACKf3lTazvklF
	rR7hxH1pv7R0Y8UwdwIz6zJkY7GC8pN3S3yplK8AVL8pwspO642JguJf8I00h2Gj
	dBd+10MMzAmw3i3bHYXKdGGD6uNxI90wVN7M1FMfUi3EG9O8wgb+1t5q2ToXDb6E
	58gINAfdum8IRmXumuQ+oESng8kNmINbx6Qqnsz1SyzfsqdsigmRgUyOt9MmbC5H
	uIhsww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eh9np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 05:24:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so1683208b3a.3
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 21:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766121850; x=1766726650; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f2jVuL0Bz+ej9c5464E/vN6YXCzWpbQDOG1kB6pWIUc=;
        b=NVjOD/q0AG9R3y0uMGPohG4uOvkQxdnYEDbKLZZU4lBHScfXq7/HUdkqP+1++ewf5y
         QUJ5rIhjsRd1W+VZIXyslUXSbDOctJGHd9O/w4udHUfVJRWEd2DzTZ5cW2LzPHBLmXCx
         c41mVdd3rzxUf0K8KdthFgxlSEXoMka6Yb9va+IZO5t4d7VcUB3PnCdSUci6Du90n+Xk
         pVVBIJgZhUpLDIgbS+2CAP8SodTKbww3YDQ8nfZp2EPi+Zd80FR90b8q6ysco4jdJKiK
         VeKTY79StPk+8wS0WvnA7hV6UQ3Zkr20cPdzMErj1JVvc7XkWegNVgoivX3mltQI0jn2
         7RnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766121850; x=1766726650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2jVuL0Bz+ej9c5464E/vN6YXCzWpbQDOG1kB6pWIUc=;
        b=Tku1MPGYtHNKR+mWoXlte2AK9KhDUQXAG8JIBy6syrLtKSbcKpMFm+Wp9LAataxha5
         Hi/zXxAxr2kuRy0+nUXhBpk+6/KqIoD/MYriW89y9BmpdqpYs/XyW4yttXuFmPZi+iX8
         8AU56VNwR7bjsc0Q14thLcDWUFmdPPEjyM0BUvFJPfQRa6nLW8kpu6BEBbonYoVZ8EX/
         SthutMVXeH+pI5/PlBPjMN41msFnlWfVP2FGEvJYUzbLC8fKre/TR5aIGGHqgxDu32I5
         pC0KOToznt4fd2+chR6dSyIK0IImnWGAYZ6AABJB/qMXyFb+7FApulDI0YAr5zD24V1s
         a61Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYSWGbH86xCywhlatmZ88ZOpHXZ7YreEx0CkZULYHBfPKGivKDp3YSP6LXiPdJvyLtY30WaGA=@lists.infradead.org
X-Gm-Message-State: AOJu0YytI8Ua3wk4EjWNVyCWBXl/wRvPQFHaUGlFhokqjZgV6vNNirfH
	CPcvl5PPqjg91Y5rMfVeKNLGO1uBco5qzGhUoICBgGWacQgx9UQ5K4kc1b/eHa25b7AbrXjE47U
	c+LRMqHGlGTfMhN1WASQ12u8eEf8msyqKmY8KWOs5ejrXVD66jKX+6Ditg63GQIBP
X-Gm-Gg: AY/fxX4dtzmhEEuzbmDLl6w+d8zevVmildj0fShMxxMxNuAoiD62tDHZpTqAHVRGqoZ
	lVdBvnpudCNxR8Qt8i2D6bct54smBzug8z+VFHm2TdDFbaJA/vth0x9sqooJE1nLDjDdaeKn6jl
	abXC1Bbei4NQVrEaa3cXOLL4rspblSDNGwmIjfcVEu4EHq+2kaXsetTLAQYpupN6MhTpVx6pwEO
	Zo8Tws2A0LR/rL23FcZ/nPK5roHE4mEJ/L2hMdIUzRkV3dYlLkGB+kBVq5jWezlGwEHB6/2EVU/
	izLVLwF/WufOvtdkPAhbyFo491HwSWFNqlTlcbdAtpld4MJt90z8YVqg5Q315Cc0pj8irquxoCY
	B2jfYpWuYcimSf7m1kDr1wEu3LvWdwL21eP7MbJIkpUCs00GzcdpCEljSf4icSg==
X-Received: by 2002:a05:6a00:6ca8:b0:7e8:43f5:bd51 with SMTP id d2e1a72fcca58-7ff676624demr1420522b3a.61.1766121849894;
        Thu, 18 Dec 2025 21:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhNQ3Te/f2XMrvAgCZ2aPBy38yMuSSI9w3vtSAX45LrLQgNLXDnHqH4Y7M6btY9r8I1mSt6Q==
X-Received: by 2002:a05:6a00:6ca8:b0:7e8:43f5:bd51 with SMTP id d2e1a72fcca58-7ff676624demr1420502b3a.61.1766121849408;
        Thu, 18 Dec 2025 21:24:09 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19d8sm1011419b3a.42.2025.12.18.21.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 21:24:09 -0800 (PST)
Message-ID: <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 10:54:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri
 <quic_rdeuri@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3Xr1jipdi3RD-kci17F2kPca-IwUycA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0MiBTYWx0ZWRfXyCJFB+ihb6q8
 qlejV2peVvgsg5W7Z8EYcl0YQ4z10fQhsDjSrtN7mOP9++Il1nUNmYSJU/eQdJL99cUpK9CCVfj
 VRhey1k8DlmMJV6XwWlZhZP8aPkYbv1G+iKTpwNFVSQvS2uloVLM2ChtLYk1m/LZAKdu3eLi+4H
 bsAqWW3UlzHNQl5XUX88IwbQ3gcNvEnmaCrYsYyCNxFDpMmNIUZ2OVAUSiupo0zRrJPn+9/N8tD
 dzaspHpFvAbSprGJA9o6iYYdynibnqbWTBCfg49+TP2uyMM0NnnJNWpLiFlKZmt9OOLodwK0Kgw
 Kag3pXamyswVQwKETI0crMkSZDLLJliMoXjzRC8XMowEJRIBpMJQ37lXjZ0aKEX0Y6nvq0hguY4
 0KpjLIBVGRAkY/gkUfWRJmfWVIdTRfY1H3IOLBqu/w33ajnWbE6wLaBxL1SLwueVgpr7gUr/Mo8
 UGNNU4JiibwK1WlVtdg==
X-Proofpoint-ORIG-GUID: 3Xr1jipdi3RD-kci17F2kPca-IwUycA1
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6944e17b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=U98CeTqYmU67p05RdacNqw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OFcc0y_4Mb4PjAsfjdEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_212412_590343_34D2F2C9 
X-CRM114-Status: UNSURE (   7.41  )
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



On 12/18/2025 1:14 PM, Dan Carpenter wrote:
> Destroy the rhash_tbl before returning the error code.
> 
> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

nit: The next branch in ath is actually ath-next.

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

