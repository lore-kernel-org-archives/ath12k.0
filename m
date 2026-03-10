Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A75FCC9A4
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 00:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=; b=bM5+dnlx433ZlgBNPHQwZ5X6tj
	akD+rwIOovKoGfjsC6phPwKEnnPVTJZ8uxj8dNqaislmLazP+RMZd+YjtYIg2lA6mRmo4A843eZ1R
	TASweS5RdflgRlXAeEVN/XswH44p77I83ZBv9wdP60Rd8dESauvO7cd7IitML/B/iISznrZ7QO2wH
	y2QhYeUTLOCiIcUCNQzYSR4y5UlVMND4A6Enbsp4ONixQ20a+naXXoYmBuuqum8Fau27lSrHUV2LH
	3LN6rzsFBLdmD7oM9MM7KcOKjTQ3uY9lg2IouGhVyNmUdtZ12mUE12y+NT9q02eRmsL1qgf/N8S0/
	JHTs2ykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkch-00000008Nbj-4Am8;
	Tue, 10 Mar 2026 00:06:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcg-00000008NaV-2WaF
	for ath12k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=; b=PmrbiCLQm7U+ZxM/OykIq3IS9d
	Rd708R4j710xZ9PwWoHVRNeIZHKpbt9J6v2RRmBWtR/gnLzXE/l6Ay5dHGg6IE+S8esYVSk/y5Ez5
	NMYs6wJ9pXH26ArK86fCqpUE4DR/oZWggXmKkIs+SvqvMQWUlqgGA7oY7mS4vYYO8vHkHlB7qx4gi
	HAEDsUz7HGD3AZK9sEYCjiXRUKIalOdTVNf7kTwjIjBO35tosXdEwusxRKwWQomXdBkILMSEGg5I1
	Y2Wwhvy81gTmPKI9w5bNFLV4hdgUW4TV0e4pc6NCyd7L/SwfnvkuByl16LQlgxetybkLcxbDmnE+2
	xGxD3cXw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcc-0000000DNkI-3GjR
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 00:06:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBww5296579
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VFmhFycj2WExrdRTfkSysTZd
	dOqHarJ5plPefogYPpg=; b=JapuiHfLWZPy7Qf1nLM6DfJ2elKq7wWA9Yz5rN8O
	RpcjqtxbVZQzPTeEaWzhCzJvIQB9NqUTVZPR0OLNID2rxrhJ9m0OKBhLQdtt+uQB
	yuFo+H1vhdnVA9t6TKi/gGnCrozq5gKa6R4+3bReYtOAad9u/0n8Jo8QPHo7xI8D
	cCt/YeY2P7veEZ7jG7qhD9+DzYDBeo0J0H2ZHl7U+XfV0as0rPy10njp4OBO5Vhz
	yGlYbJ/CR7EkMmFIcuI0Ai5YHFdPRfqBxlTo6PghMlnTWcANCodJh/75Qk/GjMov
	kGUR7kIDRhzZa9CTzNtrE8raj+VEE+v7OFR4E0kTo741+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1wa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd900cd3a7so482802485a.0
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101208; x=1773706008; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=Vneyu+Yc9O9E6gVfEWX1/6Fg4hHjQe+X8SSm5R+rGkJA+ffIyVW64zKKk7KdSdPTzZ
         G5SNARGt17AaMn8tMbCKLhW7D/kXK4lLkNHi+agfDCzTXruPI8kUxuXLx7fZ0UvUlubv
         9EtAdnkSB8qMs9AqJ2HqTm8Og0TqntNWSHjnA1FsPgHrlnmOZCpFBGt1g8Qmqdh2DL56
         uTUwGoHs6fO/hnx2uudDWqCBso9z9hDx7aar2IJI4RnZxXm4FSi9LF2sNOiZbYr5w3kw
         LQeQCRimFenS8l8UeHc6KW8JivBNYbVrnjlzEbMY/yZmZPW1V3Ji3OY/BawSgVgd+bMf
         ZACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101208; x=1773706008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=muIIlIgt9y9sZBGw/9A9zYoyq78NnSkcxMtSM84L/IhVeQy7RaCQBSd5lMBtcFZn5Z
         DrUfloyrIketvDTQk/b8I84slk0qXP+c69HXTt9m7KxnVblIV1dqfAe9jFN8FO1rrL/J
         i9Risq6hYv1vzRGwD//m1JS9D58nctH2MzjON32/5HtI8cCQN9SDivZQtO1BqEb5BFed
         ei8C5/FvRmXUGdfDJTaoEvh9PehUlbjhsTl2IHT4FT1JxnbwasqVN6L3eWPOu0Ik0uE7
         b7omdE3+O21bGCqV2ChVwCgl76t4G/iOu/ly35N4ltXE3HYw+iQ+CzYfQiigiavEHVrH
         pinA==
X-Forwarded-Encrypted: i=1; AJvYcCUKC3ByBSAq6+pNVQ2EUohCwBHXHY+E4r9IFObIs0FPGz2+klndPxnhM8cOCumUliR6kTXtx0E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1h0XCam7nDvuDtidHQtV4Bh3jJcowG9n4iJS44WnaNlwyLex9
	6/f/gZoQgJmGbOpwYI/IWa6rV7KH6v/Eo9HwrjPlZT8WFX5KEz8QNAwTit8OaZ9ZDxeqib1U1+c
	cv2qmVawVb8w9SP5/YboMDADt76wUwzVKHFTf4aszVHvIW4X1k3WxHpgyh56pUHpo
X-Gm-Gg: ATEYQzzG875Zt9bZuZJ+jE2qY9mQJZ7lRJWa0ji7DZVvxZGnpbOsME9OV11wBjfX/IO
	nBBbvWDDYghBEYpp1mC1rDidLo/uojDkmzfbS3HS7Saslu6S+2v0V/LXay1dIuyZq/QiylPtRQG
	p/VpLfPVZ38bOX9GugxqG0HRSgbLaVgiJnXXtdU58y0U8U9X25RT34RZpCVgnoaFRmxVSiY8gVJ
	/6cXB6DNxhvM9yBjMcIDIpSAnJfyhQSpcQS8SE3zq4Igxo3RfRnlmwWZ3O+oGjOVc6f6uPvj23s
	nyx/CrMohmStUIyMfQ8q8v0rXhl7FK/7tsM2tjEeYHQp858lct/IoV34caykjnefXderRN53ZkL
	9WBwzKgFL8DklEXEnvARcm3xc52N/CwWzwOV4LURCZ7SxTCt27GndDAupzGP2h5U+Z07NFLbIVB
	U/yWqmuioVMJiWLnAqZ9XdzkLoS8J9trAjGkI=
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1675002985a.59.1773101208108;
        Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1674998085a.59.1773101207669;
        Mon, 09 Mar 2026 17:06:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08641esm2376849e87.74.2026.03.09.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:45 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <sm2yj2zmhswp6ydjeonal2upnm6qwokivmrnyajmw42iw2zeyu@d7kwprkm7voi>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4K4UW495HEbz
 lWy1BT1K7SyB1uKXTVIG7jdeb7Fv5RieWFoSQnneH4pxTygwH/oaKGGzx3Ai1TRjE3rAOpcLUAf
 hFAAha/VRrOxFNovUZsZnSKttqVOV3BVqWDjcOV/EvVuY3T0rUJie3odUhE05kP/NH63+QFJNq9
 CflRZHy91f6OjxGawydNVn3cDENkuMVlkP/TrbAwaK6Ra8CPC6KzvK4T6OhB729K+3vyv1AMXYW
 SbO1ufoUq2t8Z0ryXXe/D7UAHP++mjvFaAZACwiaunneXzvIEUNdEhNWML/F8o9mnKITdh3rSVQ
 25goZEhvKLgaR4CuLpn9vzsWyIXU8bRHypO0CVv9kkFTpkdTn+6JpX9NLIUlFOrlS8DG2/ZOL6A
 kV2SbQqQmVXDl21urxHVb8Sk8Uejf144CHLwHeu7HaOzvVPT2mPSsMqsHx+ZD3mlOvVR/h0rPd5
 wRIOcP208O2POm9oN+A==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af6099 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1EgtvGsZK5M7WpkkhHwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: y7hke-_ztpRmAZ9cDzQtl2y8V89vJqeG
X-Proofpoint-ORIG-GUID: y7hke-_ztpRmAZ9cDzQtl2y8V89vJqeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000651_656862_4D1E1A6A 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, Mar 10, 2026 at 12:03:35AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pdr_interface.c  | 4 ++--
>  drivers/soc/qcom/pdr_internal.h   | 3 ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

