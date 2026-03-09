Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F06EFCA19D
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=; b=iW78dmHQl6/357ZtFwIAI/FxlI
	XsFviucT3PeJr69l04FdPJW7NC+DWPMHwUwf9eB4//LDVs85IsUKaKldIFFQBnqYcUKa9BDqwaQSw
	+U5J8lD1sytPWb9VhvTDhYiQrL6H5IYURzcYyMrEhRuI5ArDT1AGXS5xBrwJAX04I38sBx2v0OoyB
	19neifGKWEFZ5Oz4J0giqZI2HDTQUTqQiPCzKp72AdNUP4bcxkUvRB3NH0hs5eI/rxkH2rFjRbSjk
	K3u81mXNjpcykvm5lU6mRiiAUzwvkMF2K5L4lwKBZqlb59vfYZBlXGG78tvGyi6Me1TIjLo2DNQIZ
	vJF1eKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfb-00000008Gdn-3Ez1;
	Mon, 09 Mar 2026 23:05:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfZ-00000008GcA-2LKK
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoY21920926
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog
	/LiUHgfg=; b=TGAvtC+VhFmHdK/SB4QHiNUr2OSxTf0TIJZ4F0waDT6myOD0uEm
	TtQSwYPGD800TpfPWF9tvzFyFSMsm4U3ggXX0egFvddV7WK5k+1cjumsgvIIb08e
	d01KNa91jg8hUOmeX2rtwN5upjv3mFQk6m7dX9UikEgQjlQm/RTaxJqRnToWyg6d
	GuBF1d44869BgXB1QtEIIQXH4XUToPE8AJG+id4DXom4TDuhbLSjI5Xi6X5P6qWh
	Qu4GQ6h998ay0j0QNOK+GKhCKu+KWCUPnniJ1KY5TO5achSxfbvtkWOjzXQtcQB0
	KIYedqR/pV5hHJpYd+ZJ/fW6bUzG3t7dbsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81uv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso1258668285a.3
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097546; x=1773702346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=;
        b=OZPT2DVfbauAi2J6R10E7hVzbyn6qijuHH8NTQutqlaF6vKE0vmPlFueHiLw2u9npH
         53Ps+5y/RtJaBhUvNcXdJ10kw2UhfvG3r8NgH49ZgLbDCG2wb5j1x0Ja/4B0uen6DOo+
         xg2MZvu91jvmDY2OjEpxJUQBqcme9HB28srn/WHj7MC9yxDg3KmhoKnBoxDygHefOOha
         qPHJ3tOYlwtmyL53Kplg6bMPql4bHySC7S7nlVYCaWdOnD/5TteR2orLDRKtunLj+efQ
         wVYH+S9hjfmfbxhsg+WKw4fCl1lwrQ4P3HffpSuVRRExPYqODWbRP6xxAjsAV6eBKp9l
         t+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097546; x=1773702346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=;
        b=uL5vbSW17ffxGqwYee+orz8IMGYIYYumhKQ/EKq1t4glt84fT1MF6uSy2TDwPCvBB7
         wtNeeVmmqvwOhbxhBH+7VcGd1jt+1C4nJxYv79W0i8QvtCaL+hqFKdVO5iC4HK1H9M5J
         86YBnU1Ye/V3MksLkeUl1qCa38tb3ctq/RmLEWnuao1D+KAWHZccz0pv2sv0EsYTralb
         HP/ECDWgUvYWqsyaaHt2Z8WIGkHV5UeXtHdy7U8emAcIE+cthq3FJQYGP7V47cWrhhHF
         CvfhqdssS8v1qjV7o5pWwZp6whJq5rPXvphHpxPhWwCfi0jqGoVpLVbzKgJ+6KeWRSld
         hb4g==
X-Forwarded-Encrypted: i=1; AJvYcCXz2gfX6bISCoGIny+hoVIXpwuDGKHBmkLQbno3Qz/QvLD/BdNoCFdVEjL+P6bwAQs95yFIuY8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrfTHeE7VIKGkl41ZlQahAWPo92WzaulFQYSB9gpemKEQ40s8Q
	JKq+yBlsR9ZGATgV8yy7lfBvhVwiYLKuB6VNCyQVJTMN/o4gZoz/zkPD+8daKgZo2ZpYvxKB6LB
	nnIHW46MswQFfWi/CcMEoA0Yld5pT/xuOv19VPFZ8Mvq2lHhB347D/6faqbfZOgPr
X-Gm-Gg: ATEYQzztF4JUolY9r2JGty1XWxnRK2DpdJJNXxkaVb5safvnFenyUKlU7WAgS9QSyKj
	YbjG3lUOsNKB8D4H5IEGKx2AQ4MFnFP5CRUMKBZr0V43wTSL4/npXbv1vvOJO2lj0tQbebmw0FU
	X7DeoMYk17YOcyv2qn29ge3fI7LApiUUsbCDRB+HzNH0CUQxAt+34OVTvSr/So0Dcd9YMQmHGHY
	nuy4XKQea0KRdWc6NEwFA9Fx6bY2AGjcBVY13acr5CefBwnlV6B9PLn7mZNmuUVxX/Wkye1DiIA
	a/V6Vkhn26cOmjd0iXgwx//1v68zHYjFzZDb/ofW9hg37bSR8rp3w2V9ATUcnaHCp+JkDuTNQrz
	xJ35YyXdBJ1pzakvz1rhc4UYxIFkYKrJqQlbJeYJliG7AEN+1Nw==
X-Received: by 2002:a05:620a:26e9:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cd827a3706mr628589285a.72.1773097546386;
        Mon, 09 Mar 2026 16:05:46 -0700 (PDT)
X-Received: by 2002:a05:620a:26e9:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cd827a3706mr628584385a.72.1773097545862;
        Mon, 09 Mar 2026 16:05:45 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Date: Tue, 10 Mar 2026 00:03:29 +0100
Message-ID: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af524b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8
 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=yGX2isoJ_2WtN150yl0A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 8xx0zAYxhj9N9jwD02Dbkry6n2LDCn0c
X-Proofpoint-ORIG-GUID: 8xx0zAYxhj9N9jwD02Dbkry6n2LDCn0c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX407l8X31ssjW
 HGW891gVsSnsZzeq4KZcC0SsGlqvZ92qGgNGk/ewNG+UKacwVOUbyWVGfaUM1D7dAdj1cTKTx2e
 t5LgQVVwt1ERiKS1wFd9jorRg9tfWxIqXRgLWCMo0XjsEb9DJoBX2CJJXbF2zLhA7u3SbqT4+rI
 q4kZ9keU8TMrlCWRGD1QxSuV6wxf2M3g9WomoT5/ZzRRdkGBGxpGdoB7ZKL6N4LPbNYF+Mq1tPR
 VySXxtowWtntmjxsaxlyrZ0lQGRwDxea61id9l4wDTq7yd/LrALLtDjBDfxGMbwmvxedsH2NYN9
 0l75xdnt2wail0B+bFxc0sOAuBGjbsXcQ7LkngxEjHA/Co0na63easAXm5Bo4h9DN1JmfJF/iIj
 ceIKsp+IOSUuEqXL+0+0YcNUIfeqTYZ0/Ly2cZSDGy2bTQh4MPe+QfIZ04ohG/iZPFLzzhz2Xxw
 eENW0EDdyLSsBb86qEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160549_610303_CFAA8197 
X-CRM114-Status: GOOD (  15.16  )
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

The different subsystems implementing the QMI service protocol are
using their own definition of the service id. It is not a problem but
it results on having those duplicated with different names but the
same value and without consistency in their name.

It makes more sense to unify their names and move the definitions in
the QMI header file providing a consistent way to represent the
supported protocols. Consequently the different drivers will use them
instead of their own definition of the service id.

Cc: Alex Elder <elder@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: ath11k@lists.infradead.org
Cc: ath12k@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
Daniel Lezcano (8):
  soc: qcom: qmi: Enumerate the service IDs of QMI
  net: ipa: Use the unified QMI service ID instead of defining it
    locally
  net: drivers: wireless: ath: Use the unified QMI service ID instead of
    defining it locally
  remoteproc: qcom: Use the unified QMI service ID instead of defining
    it locally
  slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
    defining it locally
  soc: qcom: pdr: Use the unified QMI service ID instead of defining it
    locally
  ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
    defining it locally
  samples: qmi: Use the unified QMI service ID instead of defining it
    locally

 drivers/net/ipa/ipa_qmi.c                      |  6 ++----
 drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
 drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
 drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
 drivers/remoteproc/qcom_sysmon.c               |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
 drivers/soc/qcom/pdr_interface.c               |  4 ++--
 drivers/soc/qcom/pdr_internal.h                |  3 ---
 drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
 include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
 samples/qmi/qmi_sample_client.c                |  2 +-
 sound/usb/qcom/qc_audio_offload.c              |  2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -
 16 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.43.0


