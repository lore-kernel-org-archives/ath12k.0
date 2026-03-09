Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62D5FCC9A5
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=; b=oOVgU6D3Ksv16sE7ifSOKi+GSC
	9IO9A+L9qK5FCwgwExOTAIERKIhSIK/ioDNP2prZL0nYONobEvmLKYhfHLwx3bc9OO5leOOUKuScC
	Ht348BxcxAlRJqQyBhOcokEkIY69BS8wHo9MPIG8LY9CULm/OE6FuBzXwuWSJDG8uTu2cCQZEqQCZ
	kau391XcKJfNULfgJ+zJ7Uns6cb7ELruPOQrchjTxQyd0erN9Z2eIdAud794+OUtAU58L4MWI610O
	K5QU2OxMDOR1GObZw+E1p2EsCfY8z2mwQmQfKj4V5qKjauTry3jvzrpAKQ1QWjkaNKkHbta8+UbIp
	1H5e7fmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkN5-00000008Jph-0tlc;
	Mon, 09 Mar 2026 23:50:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkN3-00000008Jp4-1Mzp
	for ath12k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=; b=dBSNJ27IG2bXcsf08zaaZB3LrR
	CdTSuzA1KZItafUG36EzUDA3WzUkjBkUPWkdeGCtQIxAJ6t9qGRJVoYCqN3+kxdi9u14utn1NSPVp
	uhdV5PZ/kVt2uVEogKfrW9hYroZD8PyLlmSTY6d2b3kSpuCB3B8CY6roQGx+HStH4TzS7XZSwRR6d
	gzfaKw2tXYg5AJHQocyy2AVdhLJAQMGVwkuK7aP6UEF9dPCS0XEA13MvQxmoPfZLyPgU6udYRliC4
	qv/iIlcx6jT7jGm+Mo4k4HQirLk6dPjisx1KN47lmeso3SyIGE88pY+Y9ryY2LOq7+J7Cn67S2KWr
	o84OENOw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkMt-0000000DMMc-32a8
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:50:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBncm1660105
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=; b=IQgsSFbn0KFUnTb1
	KDrlCb6DNjAXoPA8Nwvhml10EY3QiGV6sjcWdNcnFvTJTrnhRVGJDtbhXabxBPnO
	BFpeIJL2HBaHQH7kQciQbJgYijhb3lehwUQC0cKolzAqoof+fVPKpuoHYKhB9Hgl
	BuQBFoeu9Hd+OfySMjSvJpeHu8TWZsotLGbmQdkOPDDb3/sqO2JBA9vS5polGetk
	fL4zv4ya9KZWdQVnq0gUkDwX3qHUozGvBXji0UFEYja0gt+AGzmuTNPejNDJohox
	OT/YvTyzG3CdAs6InKcMXboMSg94ba5A1lPk9z5x7jvLPjgpl2gEd4edPd7aC87I
	eaYn/w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr41p8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:50:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdff07d8f4so13730672eec.1
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773100231; x=1773705031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=;
        b=UhtbBEbPcTeFkRb5hyrN23xul5qIFUI9nGyZV5n8wBNNKjSGDt95rNx8FDTZrKZoWG
         UvphbZstG+fBAHG9cDgdtYCmrshLUdZ9G1MkAMnykTQoN8d21A+inDbbb3DQAQ6kGUxa
         Vpk1JG62KDvdc29TSk1UFC1FvAFMV+uDW60KYK2GMgGCREgKJHCFuPCUzClUVTH6Ov4o
         oak6LAE4f4cTiRm9RY5kZJrjFsxc3JuvQi9r4iXig5plbkndmXVhvUMQ72ivu/WkQPBC
         oRmEUdm76+UYPZ6NC/PIZSQEK4twC6goJbUw7QgqF8JxcpuYl9vQdLR0M2URoHDRDNhR
         y7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100231; x=1773705031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usf2c8oheBhN4rTUg/6UxDx9DMs4PXDC10F9BFyFRk0=;
        b=wLfzgeL6YeW4iz0bX+1t/YaI/gfFhZWvjebYsoQYq0yTwj+CxvY28zQyVD4m27MQdJ
         VhsT/pYSYNISsENts/nuX1+EvovdzZ3Kb+CmD0pSg/i0bVDtYql03gObgRErobGdfqDX
         rSXjUnmXZAdG7ZG3lIbXjw09G1MKhIF8+3mn+RSoiushYFpQP8eWwLm4xzuFk+By4K91
         v3Pg1X1RgaL8YJ41PLEjqUTU4yWGSWvwX+G4N5H30gE46U5/v7OWPj+e9/iWD0ge/Ogb
         /NyDHNOsl8ZiPdAigCtCMHjC1kx6uXOcNdLa9cJmkhziqaNMUm+KouSKo+Pp3ff33DsC
         oSyA==
X-Forwarded-Encrypted: i=1; AJvYcCWxmCg7sSktYxJHboPMX8vkqeRP/KLNWWo23dgkRf9mDP7zPm59jOMaJPuZL3wtz+uNEt09Cig=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvL10wAvxShXILF5HiyNDRt0oSOFp7HwjKr9MMLj3fjAW5DFNI
	mfMQE7RYNG5yOfIVAYH4q8Ip4yVfdg/eXeV+8ut/3JtM4KPvTLiEky7y0WjgLW0aoVZkAWKjM5y
	ro/CElFAv9DsmwH6gC9lrdzRA6D7rh9easdGNtyfQHtUDRw4PyuUaBzJzVYHHQDJT
X-Gm-Gg: ATEYQzwvnOJYyyJtPCDzRcuyvBlMnSlgKhTBL5osluGh1ORj7RL9fdVCbsuiX5vJBTY
	K2Eac/NhGG7YIUXqFh3pAvUonWbKezCZuPuDTTcloNBH7OTmrKsHsyfGzcza0GApO6oi3h6msGg
	iDJ0hl/7CjF9TLuLt+YeoAtpR6W0jqSV3pgqG80hzWqUZdZNejngLrmQwsZitfm9DV/8ZcKgbBo
	N75ZFarRbA7zRCsCu5KI+VgZVqQMd1mosthaYuECT6iS6b8xb5xZ+hq8NuVIs943zSMWaY/G3g0
	WUcPPLLffVy5ThzzbGl+OE2gFpb2KLGA25bwGOcnMvTONTyh1VKtkh2aNZXqj2GiKf8cYKqbwGz
	CzoyaCilGhnD+Hori6fv85aWFix2QRM6wCVDLcZM3zfhYT35U4THWSrEygQ/Y7PXAKDL/BXgS5O
	PMH/f1QVXN5h5ydw==
X-Received: by 2002:a05:7022:629f:b0:128:cf80:deea with SMTP id a92af1059eb24-128cf80e01fmr3402100c88.1.1773100230947;
        Mon, 09 Mar 2026 16:50:30 -0700 (PDT)
X-Received: by 2002:a05:7022:629f:b0:128:cf80:deea with SMTP id a92af1059eb24-128cf80e01fmr3402088c88.1.1773100230365;
        Mon, 09 Mar 2026 16:50:30 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128dc848cbcsm3108879c88.7.2026.03.09.16.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 16:50:29 -0700 (PDT)
Message-ID: <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 16:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMCBTYWx0ZWRfXyEInxGJ376tY
 mJ9k6SVEzdOCVlZamcMGJxTaS8Zsxb8XXqITo4Utncuh/hx7BDNgrA8WZgfzU7r38ShKPhn2Z/5
 iBOfj+0vqqe3mMkPHqjXQKhNLNgtKCwIAKU79b3MnnzLkZKPnP6Pm//7aL2W8X96Gx4wfKSynEz
 O4e9TQo55c0HW/aIzrh5QXnFyEtVRvrl3OaJy+trcYSVIf8lwr7mXxQHpmQ2iERIZL2iEnX9ju2
 7/IheQHkvu8fwS1+yGxVByMCoJPbif+b0a8DS5Z2SmcryCfd26H2DOPBaftoR9U1i7S5L7SmjI8
 Jt559CzEy4WgSgspWKi0cQ3nMYQDl6EomWrL7FJtWwByPcRRy1EKA1echuy0JjoSUJfyUTu/WdH
 BNC2BXKRkN8IcNU1E4A0cw9oDaBg6Ve1waTYWFPypzTjf1HD4DtmbEnarOcVpa0YPeCJX/3U9w4
 1x+qy/5jyG+jXgsbLEQ==
X-Proofpoint-GUID: LDHgZ8VOUhA180iiTpyA2Mgc_kvgYjJ9
X-Proofpoint-ORIG-GUID: LDHgZ8VOUhA180iiTpyA2Mgc_kvgYjJ9
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af5cc8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=20KFwNOVAAAA:8
 a=KKAkSRfTAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=GmBS2Oju3p3q64JsNm8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_235037_230261_28DAEA6D 
X-CRM114-Status: GOOD (  20.91  )
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

On 3/9/2026 4:03 PM, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.
> 
> Cc: Alex Elder <elder@kernel.org>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Jeff Johnson <jjohnson@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Wesley Cheng <quic_wcheng@quicinc.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: ath10k@lists.infradead.org
> Cc: ath11k@lists.infradead.org
> Cc: ath12k@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> ---
> Daniel Lezcano (8):
>   soc: qcom: qmi: Enumerate the service IDs of QMI
>   net: ipa: Use the unified QMI service ID instead of defining it
>     locally
>   net: drivers: wireless: ath: Use the unified QMI service ID instead of
>     defining it locally

prefix for wireless drivers is simply wifi: <driver>:
so s/net: drivers: wireless:/wifi:/

>   remoteproc: qcom: Use the unified QMI service ID instead of defining
>     it locally
>   slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
>     defining it locally
>   soc: qcom: pdr: Use the unified QMI service ID instead of defining it
>     locally
>   ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
>     defining it locally
>   samples: qmi: Use the unified QMI service ID instead of defining it
>     locally
> 
>  drivers/net/ipa/ipa_qmi.c                      |  6 ++----
>  drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
>  drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
>  drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
>  drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
>  drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
>  drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
>  drivers/remoteproc/qcom_sysmon.c               |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
>  drivers/soc/qcom/pdr_interface.c               |  4 ++--
>  drivers/soc/qcom/pdr_internal.h                |  3 ---
>  drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
>  include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
>  samples/qmi/qmi_sample_client.c                |  2 +-
>  sound/usb/qcom/qc_audio_offload.c              |  2 +-
>  sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -

You are touching a lot of subsystems with a single series.
How do you plan on having these land?
Do you have a maintainer who will take all of these through their tree?

>  16 files changed, 25 insertions(+), 23 deletions(-)
> 


