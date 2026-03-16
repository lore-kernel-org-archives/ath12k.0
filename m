Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35435F53D78
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=; b=l4bXE1b5JFCUGvNBxTROMfGj/j
	OTXhKE6nlZi6bADaFhG7hcctSEzw8AGa096l3ey0Hw+cobQclsVMgXwFwxKn1yeCFyE8jwHRoc90q
	vv6+Or51iW3/S7Xp7fPDsBlG5i2y5VFN7OFtHjDNT3oy4xwlFVBwxf7vj35MGqFBWrdAxAL6Z+VSe
	q8kdQct3pCr/pKvxQSDqOwJlfe0H7E4Ax3FntkUUtJsRh95IUW3xxxciSQGmVip6LWQ+ef0wJJSOI
	/Lj9qm7hKAXkdoiKiVXJoBwkSnKQk8ZQHBo+uuMDuVoOWysywa9UBJN1dTP8VKmrHlSJXtLZ0hKj6
	+2jC1YlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWq-00000004WfF-3x7b;
	Mon, 16 Mar 2026 17:14:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWp-00000004WcD-3pSW
	for ath12k@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=; b=R/BYQvydaSMLFVAZVg5shpV5M+
	QI5gNLLoBpByvFCRGbyLwyzQln3gnY0IvlifCgOT8JuPOKVKyPYyDW+ypwDIobvJ+8gg1qVs0hamd
	L1XnWmKmwhHvA5vPPtqHRFN6od8R1xC1mEtgTZQB+aMmmvEG/3yRxkxHqBZdoIQAy8iz0owHbKJpV
	GfuKY+JytVBFI5MjOWFVbob3NoLOuOREZ1jmpHzvfOKrvZumMDs1+5Vpv0ux2bIFdBgsgSoTnxScU
	oQa6AcQUsaGoEULAEd+dHmuM+astvxfeLjwgLCA9IFdfwZzUneyjyQKOVNPM8ENPvKdjfbtTZlptX
	C4fmR3TA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWl-00000007IQt-2a8o
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF2cW71533932
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZoAGvqbvmk8
	WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=; b=kfegwWmK+oeYWJpckng+sZks14U
	rsp48Lfzham+N65Zre+9ESiRr5oysAv2RkJYK7Y+U1U3MM/CnD8fkCkDZkAOrGUW
	Hpx6CYpG+On9figKHVPAr45yictYQnhXhAUrutjya7i9Xr31yLY/RKA6S+hzO5ZA
	tVsYisIr+HoXh9INI1/BlXHpPS0mSWQneF1qU4EmtOOvJVzdC5r7dKj1v6MmYSNe
	MiNWiBBVxfLFnBIb40R0DteoqRIwA7azcqxzpQp9Jw3OycFuhBKR6sDy8FoVAiun
	FX7nQKMr8eGtigtM96RpSP4VoX/itwoVqd0fo0XuZ0vROwJT3T3e8omsNSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k0gyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4d85d619so117128456d6.3
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681290; x=1774286090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=bgW61OKTkVF7lzr1YWoEPSchZ7I7R09yIQ+mmKJp+cLr/cd/VpeZevS1NSs5ivdg0E
         +ZIhHLh+kZqXYMEXWiQMq55PpIL/8IaPPycpuHj1Cllh1nu+7tDdjCrYTe9Ql5oWGChF
         w9bjIv0cciTAH89gREDYZ0sMGxk9Vzdep+DlREbalPEeG53OQb8oqcEXxmsxn+cfB4G4
         xzKrTtcjHNw2d+YYiVJ1igUQOaLp/pTh1REuLKLXx2T3lBhvSAzB9QND0tenZwVThEw7
         L5R7I8k6iAp2pxqo9lunJXcAwvTHrkeeWjsl5Z6uo1VsvbvBEtaTt7M2CfMvSNo/d9/8
         HOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681290; x=1774286090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=f/4Yu1SYYUjO1HVdVgaYOHZELOVTTCpEaWoSfVv30RDga925jwGuxuETLiBEnmw/ji
         GwxzsL27qrt+AdNpwT28WKgsH4foZMiDdHgQjisnLcL4sBdYCmht83uQe3OQ1VJrVytt
         r7w/7NIMszbzXU+5Uj6JNZPy/Mp2mukteAP1G5mfT/yDQVf5KlAaB0z3LCXJRzrv1Dsr
         TRSnqBgx6HZp1NCQaoofwmSoXSNxsrKRnKN0oW9uZxrh3GAjcDwh9/Xb1UXSlqrZpTGR
         vdFLk7jdqJcYDDPOVH/lElP6Muld8vFJjBnt5+qBMXtwlcvj+FkDWaGWt6eix3p6F0MP
         +FOA==
X-Forwarded-Encrypted: i=1; AJvYcCUUuxVjTYAFa2fIQSd0w8HwTTokeQ8U//rs10h/Qp7I76KRyEmRP+fzI8g6mU7yYKaHKdamZGY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywli9GnINeZTjzucVQAD5ybTpX6iGdoR1zZeBJpC2RDGMICrsnj
	4pH1a9izS+dfW3EiL5toIvO2WtdzE3AqIJwMTFcdQ+B4AqiDk6M1ZRmsCz+cNNdiALTLhBnzLrM
	sETaSQPIsoHUCaC0loTEWB8FtuIpR9zPm2Y7Vew6XyCPsSq/B3XZLARMxJIuz6627
X-Gm-Gg: ATEYQzwgA7SDzvbAgY0QEQwLXI0eu767WfnfqwLC209I7lUdj83TqFcu+PI9c4xTUpj
	mOrK3HgUV8vwwEziHn6nwTM6YrXrtQhK9D2JXzogptt1OLKzJyBcHHsjSlpoN3hcFeUfnGbuDE5
	k3JZ/Yr1jTrfeTKKUqhROs/eVz2VQ7MPfZWNcYLv1zAQ1DsRKlBFYBurWga9+LETe6wdEENEsSi
	BFMPcm91RhXHiVwWfEiI7+sGxMxiDDnaWP2fZaJ36hh5L7B8HxXPBNqOTmc8f27P50UQ8l1oPQX
	cVMsELasj+b851yvxEDmsvJ3bQuJvZl/PayvhTT6SO52Qao/VEMdPHVCyFpln/HA82ca1kT0dHH
	sw7TZF2iz1Bc3nAA+saG1PZ1cP0pR3uBE5qpTA++84Q8DvZMaIA==
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1319006085a.46.1773681289461;
        Mon, 16 Mar 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1318998385a.46.1773681288653;
        Mon, 16 Mar 2026 10:14:48 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:47 -0700 (PDT)
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:14 +0100
Message-ID: <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b83a8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX2o+JyTscYKuM
 27GAxudXVObAsSbgPLGvzagwunExU0cFf698FG3t9Ey+2sy/9XNSE67ujXAwVOjRZCBuYb/u7a7
 Q2N1vViFS48IsjXvG5M7gB8iL1OH80+68BF3sj4xvbFblc7tcuU6MjPdYUSKCDTqokv/oFBDTwa
 XTvvdJu4gXWHwTz/m5l1fr0Ycu3bkb/65c0QlosiDOnIJzVEgr4ykawFlyOk15DkjZPMtud2ilv
 BIzDAA0AfAIVkuID894Js27SOyRgP2Yy8OH/TTJ3zZrSh7zpYX8qVV5AEjSntcBoGcgL1wJZq5W
 Si454Pw62Y4BXmrybmDCD4PbU3PEiHD90aTjMEJ3xtFX72LZ2ZPGWCEi8lFNs9rwlPGsEdc0egC
 a3WF0G6pQmPrDy9DJaI8T7MEUGxAawBi92WR4AytVPkS9eS6wIDCkKvhUVIaMY8oieOivyTse7D
 pWhJm+WvK/OxSYlr8ew==
X-Proofpoint-GUID: WN--prpJ6QnA8swTymrWnyLQfToR6rAW
X-Proofpoint-ORIG-GUID: WN--prpJ6QnA8swTymrWnyLQfToR6rAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171451_881702_CC3EF85D 
X-CRM114-Status: GOOD (  13.96  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 01e6063c2207..38d36397bb40 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1927,7 +1927,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
-	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
+	ret = qmi_add_server(svc->uaudio_svc_hdl, QMI_SERVICE_ID_USB_AUDIO_STREAM,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
 
 	uaudio_svc = svc;
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
index a1298d75d9f8..c7eee03225ec 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.h
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -6,7 +6,6 @@
 #ifndef USB_QMI_V01_H
 #define USB_QMI_V01_H
 
-#define UAUDIO_STREAM_SERVICE_ID_V01 0x41D
 #define UAUDIO_STREAM_SERVICE_VERS_V01 0x01
 
 #define QMI_UAUDIO_STREAM_RESP_V01 0x0001
-- 
2.43.0


