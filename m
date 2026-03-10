Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1642FCC9A4
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 00:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=; b=dxoyfzFQ982Yvs2m+6xbwYOO5c
	Ut49ckd/1uHBQ+zDS5SBpOAm3QBK3CE/N/LGeDxEAymrHR99hLG/av6F0BJiyVZp4yvuDi/isNFLO
	5mfEiP7NAAhqmaHmN5pS2jM1ECHqAXSCrnibmMTcbwDdO1IuxsXlnaKPe8jdmq2B3ZHaVLxk5Mioz
	Z8F27FKrU6P25Y6mtvkH+eeNAipmOsVSFqKOgbfR0LWX88c8qK59IbgEp8BeKsmTYBInKDveYH/Us
	iptZHoEpg/Gw2Ao8/Vkml/TTm1UJ3Z8J6jZs7/SI1CxMlpci79x/XyCvmQQyVbW2dX0bWBJGGtDBI
	t7vGUH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkdB-00000008NqP-31MG;
	Tue, 10 Mar 2026 00:07:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkdA-00000008Npj-3PBS
	for ath12k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=; b=iOp/W7IedaoVdfkTfqeeUWKoer
	CNyKznb9JPHqcSfjkxdPID5KTZD7X9DL50ioqm87C0fqdznspmquISXO4PdLswmxW1DLKRedIi564
	y8TMuAoj0csO2gP1dv2j7YB1/ycKC+oY+KyBSYUc1Z1O0osG8C9UYxLBd0XmCpRBlvXqnb+zNczKG
	VxA2ktyZT7sUMeILX3/P0pA5ZWSOShgfcqm2dHxZKVbTDvvMvF4j8E3gm49NxXMzOoEIusSRDrnOA
	6djBhpQWSfD6Om91SjrAKpeuP8N0UzAan5imHnEqR1btRLIjlcxb6sJ9CYvN44gAp9e1iHgsE4/GU
	Gl9n6dsQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkd3-0000000DNsq-1P01
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 00:07:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0gR744383
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wz0pGWQvcqBNbODzMfkbDFxp
	ojP6Pl8+dAJsLfprVW8=; b=Omrl9Z5y0ASn3p9OZgFd6Um46iUkDyJfKRJLJrlp
	SUxeV6VpjDLDoud8YjQWNEYro+I8Xya2uzDaAoWxRN3cVSUA+BIXWS2n1oPkJi1+
	eIfJX9nm8r+pNyAGPiW0UFyJD2JTLrAZBvRf35OwlA3NhKJoWoDjuUIA3SLLVV/D
	/YvZDmTfm3KgU3ATSPv736RNw2onpNNqv6Kd3vgbjBEkTlt0SgvPJxQvplqq98wD
	Vl0srS7Ut0qzYbPHAMnKGwUQzyvBrwizfdX/Ov/7i3BABT3kTETBfpg0xWJc7qFb
	DOzqKzQjwLhABBbAF5xt/X4TrIkDbf/zf/UNCBB8X0w49Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaaw9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:07:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso1768976485a.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 17:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101235; x=1773706035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=H6uJKXZDoH04MbMqGpyqOfa3dVN67ajCxD9+1E5dN7ibmL8GcPb+lMc5hrCIx1THV9
         9POeXypJCJWzrXPhaXv4D+hgLscDQ61xi0eE5uRgfG0myd5yA6oDOi8yaKh1UaVEU5wu
         prbQwNk+zzSTtP+lhDab7fDlgmvw406E5BUygUc6V6/7atlJBLpvdJ25b3pd4MPpayG8
         8xde44ZWIahk7JxswosBTw/SyH9Kb7VlRmhVyvr9e2ffuMDpncqLv8wVS7Y6m5BmGuIb
         rq3cAmZm+qXrwnFIZzkjrSZa9XrWjyxo6IMNRlO0IB+rB8TtFJ4emAEQmQSaiqpBOoDt
         r4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101235; x=1773706035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz0pGWQvcqBNbODzMfkbDFxpojP6Pl8+dAJsLfprVW8=;
        b=q4IlCZRLd+3dNbjDkB48JPR8RCUrKD5O7h+eCkduRzS6WS6f0p9AXivJsV3qzh5ooW
         v5Az6boiU7jAg1LOgB3Mck5QpS4qf2mjMy03Wxr3D+TtI1CChw9wwrxIw0kSfQ1jEkRX
         w7WxI41DcOwKwn3Er8E3Fb7nocnrsVDdwEO+ApWlGmOR9W2Tx2qAieFfdDCQFeQH5tS0
         51GYy8+2v8vG7Y6lO/yR3KQUXIllSgM18qLnD543RvzTpJ5RwWXIz8PJpEUBTSkJfceY
         REPaqOp52+1k8TSrtBBdQDurgdGXtSmdjo5o62IK48lydpQXtKJGpmb9eZZZok63ztZh
         FekA==
X-Forwarded-Encrypted: i=1; AJvYcCWcCO+w5hj+tgYaG2x/DtvNXDKYlzscsuU5uMdZEEqCKeDdR6ureazW77ALP+KaiEajizbUlCc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkh8q6OPF4T1A3lVIeitVmuepxjk/5dSUm97ZSobZpqmgYV9wh
	cTzOdy8uiuiO69SPsRqrrSGwNCydR8SiYGxFwBY+SeOPcHoQOGeAgXJF6hg4Ys1foS8PuwbI7il
	bMTCO4lBOfX90e0GrKLQOQ1cae5MkLvNckjtqVvI4PQ7lYpLHvEwRSniw6d20UWxh
X-Gm-Gg: ATEYQzxaWjHFuG27IsFGdGe1GMS/XppiiWngc8Cj+a1VRFNp7U56dMlLT/0qvbp8Cpx
	vgRwRZ7qUP6EcH7FHcCdm5s2/iLn6wqSGztkGIMEwr1dcFbLjprM/dwdtZbImuhzkSN6r/z+You
	+xmyPJ0o+tAZg/X8TtzlI/pTnJij0M8B3dmYyrqyZYMrCbVP/NtqzJwJvho3ohRtvtd5NIZQzv/
	ifuaQh+vd34eJmImh+w6wpxilH9ylAYLbms1TWzzwGTMjhe+WL+W9QQPNFotzJ/+FlhQp4Oska1
	504JNVrOrAPGcoHi90CUbPsHmga2rrRwfe4gDV5lcbO5SMDoYvy4JDchc9YE+w0xMJ64Kw4olen
	1uNIg/qzHPch9L4JEF+HgJmxojFWzVQxL6w5XB/h4YwFD+EFOMnEJ8u+oIeaBNv4wMJYbmnRmkJ
	Ngk5PzDWcLXFsP7+tQ1njNrGu4wOC8NkDKXB4=
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384674685a.33.1773101235232;
        Mon, 09 Mar 2026 17:07:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:8cd:8f94:259b with SMTP id af79cd13be357-8cd8f942ea4mr384669785a.33.1773101234727;
        Mon, 09 Mar 2026 17:07:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1459sm1844501fa.1.2026.03.09.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:07:12 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:07:10 +0200
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
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: Re: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <ljv2kfghtbnghu4ihfskli7zhiwme2owzvtuwckbbtkcmhuyel@pa2cmlpz73th>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: xP_J3vvmlOMRVmih7sc93PneRtHF5jqm
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af60b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=R1rXswN30TRtGkWU7PEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX7o3K7+Zlobj9
 JK6TFu4/OaDnQXbJYPI0IO8UwVGj51e4ViFWm4FpvNiwkGNe+L22ZhvzxuOlaATjgwu5m+8X/Qv
 rCXVwoHJyDvT7EOOC8YwUiB6HKLay/5E0GH8Gl/MmaUf3Hle3YjTYByRPpAXOootXTf/80PAkTB
 /3dyP/3jgKkhqP0fNGipuK0AyZ/XvyAkHeSZEQzROmLCrl/DFuyZikZ67YX3snEKZxVwaDIKj5N
 2axKLaoBMvz+lJHU+W0bfWElVCuZ4pUU/J+bfD54rGJr21GLA0D9LhHXwYBKcnYVAEZSF+jUdxH
 B7K7tJnFHa1jRg2HtYf4iX+yXp43JZJzkoxISM6qeOv8bxNtEscXOevymc2bz5lZObIIruGeOdG
 u1R9wlsITKh5y1kxMsk6x9Xp86OrEgdwq850FJZw18Yd/z2TzSNi5T/VPDvBy5RA8jPIQtWQXSB
 9lPowRKUPRWt89zJZ4Q==
X-Proofpoint-ORIG-GUID: xP_J3vvmlOMRVmih7sc93PneRtHF5jqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000718_405040_CB4D6C4D 
X-CRM114-Status: GOOD (  15.20  )
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

On Tue, Mar 10, 2026 at 12:03:36AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c  | 2 +-
>  sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

