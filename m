Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30072C35FFF
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wATSJrX3Sh4uYukiW4vZV78z12tm57FOPZK9qSlUs1Q=; b=YXZOHPx2FUKTo7zM0jDd9KGlvg
	mBgWPh2xQ3D9PU7cbohRnCea168IccmBTe1HfB8udri/+cSYqihWvjQzc1MrD9jJQVymf0ZaYyhqS
	HhFw5d8rsLsDBZq1GUYbSx6z1driBs4S/FbDAV62htLArvD70MU3BjGYIFHgCNoYJOrHT9NjyEOkp
	pZKoJc5wNnxvfY66sYLWE59VLGjUACmVW9Us/GoZ1QI2ZkdwZf2F7WJiYYgs6C7CgKmeUG7kHjlkw
	ro2n3QviFHBKng5gNChnhJ8gc+JG7gdYpNp6GFgTyecnDdNXSN3b57q6nVT5E8EBpyNCKDZH+pKlM
	ge59HW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuy5U-00000009pk3-3uzQ
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 18:24:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuy5S-00000009piR-3U3M
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 18:24:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE9od9004532
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 18:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wATSJrX3Sh4uYukiW4vZV78z12tm57FOPZK9qSlUs1Q=; b=EyRlfbwgZRB7hKQE
	tACX+dDGq5LS7BuMmviRaqgzH7ZVdLBVb+SRJaWl/mPF1bgRr6KqAKIY8F3zihgF
	8nhcWl5O3i0hID4dj9jnhfHjfFy83i788K8c6eTzTLN9I6n7dZjJ3GOT8zf+SgK9
	LFNK7+fmNXToegH0fBBlJziW0jbfUI35lSBL/5E8hQExB/GCTvxB1QM2aYp6BBGs
	3IxFqonqFrc9Oo6rP3YN49oYj+5hJ5Yuw+0A9ttH15eP7lNbxQn1d8mEy8gBFFnA
	3jbQ5Eoc4kPl48uV+6Pl44L3v0ATTpw2ZUKjcQquKZTo2ycuGRW5hRlM9Mxd25oY
	jLPeqw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx69q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 18:24:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2265a09dbfcso11698935ad.0
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742408656; x=1743013456;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wATSJrX3Sh4uYukiW4vZV78z12tm57FOPZK9qSlUs1Q=;
        b=TPR20dmK9V7wVQNb7yT1Yk3ocZqKGvBzzeAvB5aK85pM2L/gwHIYwUof2QeENwTRnM
         d9lbgjU52jlud1FRqXf+1q2H76IgIMk42jxXhNkfBsaDDGNlWvObMg9w+jZFFug2PmWw
         Xgkua8erk1slUZH0WOVyQdp4aFuo0oXgW5OReOt3AWv+2mA4WBIlZrle860Ti7G3f6nF
         fyPpKd68i/XDp+2Mr+peZYZf7qLqVNxEfQBw8Ric+qT2TgQEaT9HNNozqwIdhTR99d5k
         Sfwuc/fgvYuoRDSLG/1ojyTfn7rMdfDxArXzDeR5Bkpp2vh4RTaKHW41XZJ9WumCTXel
         npKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW4p36P6y6c8sP1JBi0EcBHmSv9Trp1I57fV1uf5PNRcgV5aEmPNDfUnXpDMryFAS7rCvodzI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNC/bPJHmckZjOpJiy+6KzL7XT6aUazRoNjHcZVH48yYCHsOCG
	Wr+ObMv7RmIZ/x3tZeY3Pv1ABQoWneb7lVDIExH5pUZn91SNokBbrNvf/Bow4ACn9HJW0rfY/uK
	NoADaxHmy29YjeFlX/cvmH7iLWhoKOIEjhj5eVHMKP4bWfMJsH1+LHffS7Y6V9x+TOMi0
X-Gm-Gg: ASbGncviGyfELG65TD2hQ/UX/zV4BR55sN4YtZ6DcqmG6NyMyNb7r09OgT0KHHKlpWX
	khEOmTa2ZUeluS3uFHqBXYDN+vLJ9KMBwEkh2WBq/iVUjTTlHAGTBn/RMKQ4UgUpszFSlHD4pfU
	Q49nrOlnP3oQMFa2tCvloIAff4lRHgU9Vf+RGVrnfVWZnQOVRaaFkax9zF+E4A0V7MC1Xi3fykW
	yItPKT6TecbWxoPriLO6DzP9eHu7lO9aKXKDC3mj6wAh5Ln7JUZjhhDeoJMUA8xVU7Y6qQqi3kw
	XRqREzbHsw6goU0m5+w45hfbca4BWylQBFAbZRmgo1nAP71xFADvwZMR5RVwr0WGuN8s1hE=
X-Received: by 2002:a05:6a00:ac8:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-7377a81ff63mr308949b3a.1.1742408656514;
        Wed, 19 Mar 2025 11:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjLDkR1zw4g6QPoBXUuz5/uk73dvuiCo5Bz6Vswwcg0+6FTlNg2a5r0Jd3e1WLi5Sgi95LYw==
X-Received: by 2002:a05:6a00:ac8:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-7377a81ff63mr308927b3a.1.1742408656137;
        Wed, 19 Mar 2025 11:24:16 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1103sm12025324b3a.167.2025.03.19.11.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:24:15 -0700 (PDT)
Message-ID: <76fea254-ad81-425b-83b6-30b34448a8c4@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 11:24:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Baochen Qiang <quic_bqiang@quicinc.com>, neil.armstrong@linaro.org,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7yP6iH_ZuiPhLaYgjq_XD9K1MNvKcADH
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67db0bd1 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=BmAr-5jgUtIGqfj2Gp8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 7yP6iH_ZuiPhLaYgjq_XD9K1MNvKcADH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_112418_875521_8AB5AD6D 
X-CRM114-Status: UNSURE (   9.56  )
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

On 3/19/2025 2:46 AM, Baochen Qiang wrote:
>>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> this FW version is not upstream yet, why are you testing with it?
> 
> Generally we only support upstrmea driver + upstream FW.

Thanks for pointing this out Baochen. I was wondering why I wasn't seeing any
issues on my laptop. As others have commented, due to differences between
firmware configuration and release processes, please avoid using firmware that
isn't in https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware (which
gets promoted to linux-firmware).

/jeff

