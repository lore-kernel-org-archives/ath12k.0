Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B125CFCA19F
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=; b=hyTtqMbZnU2E1BTkHZsIjhMu7l
	r75YsawxZP+sTvc1cZBkfW3IPO0SRpw/PTGUwMHD+v1WjLBuqfnkwUa/jSCK7UZucMvjRo02j72zD
	ed2P9nhYgELqld4HeddTEdIUzehHh5sKQQQok8AUlxW2EM6yRnpLu//thfHk2q8D1uvSzfAPZClyP
	dNOplVO1Olq9DpyOZzET7/AnC//eQug8WAGeDsVOoxLEEDEAp6qQZX9NfDUvRHj/yyZWEp2TB0QtU
	tourD+wL5nsBR+rJFrF6Mosw95YdxR+NtZ4Y0/FVmyZIXb/yU+pHS5q7tSvt8iOAc4alky6qza990
	sFPnIq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfz-00000008HAk-1ogn;
	Mon, 09 Mar 2026 23:06:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfw-00000008H3H-2KVx
	for ath12k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=; b=UOOznTufR7rRDmicpTnUpsOvxg
	OQXy+oci05oo2UHeZeirwesvvRl25ZvhISuG7JfTf6Rep4IbMoR2D+Urb4RQW4+XjaegsyxbmWPbM
	usoD817DBw30dOoZF3qwg+C9I9gR71ck2FYtMHuwlYmXxbHiA2WiqI18II29Eo6v+N6H4u5mYiiw1
	I5BZaneKpZPPS/1UnC1ksEvucd9vfV03rOjqKJEwOUsGJ8tcn5L2XnjMJhb0ii6Or46JAd397LMPW
	WdEQJ88Rb/16CHi9g164dR2CbJTbQ5qvRGLRmbXbRIQym6kLQnMWUGlLWNhuAJgD3ytnynJVypU2h
	M08Jg3vQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfq-0000000DJqk-0tdg
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFsQk2872796
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o+8grnDyx3a
	Y04II25yHs+DhlQHwGyE329UXeTulGfo=; b=EnmPJzaXDKfHbBKit2i6OzOm42b
	lS7sFWuQdyT6nOJsixiASHIu6RV+GBs7xstRQSxbPvjcChqJJ9XpdtxtEefvRUJ0
	/vzUYoWy6seDLrKnbfnBzBZ7VHyqTEwYNlJxSa42KZQ35lhO+qqrwgr0MhgF2v2u
	XIUOlYcxN0l/SiTaVR+/4vyGrXSRUNY4xGr02/UBTsA/bgKRuSiv0R0QaNzhBiq4
	c9maWi3bGH5wkaI4/sbRIvQcfqVK9l5BSHbTV8yOOhJoz5OsXsJifEfv9WwX4F3p
	jdImAMabQQwyG3m/dV4KrPkxvDG2ukxU3wSswURC0mqLM6NZKINavIDuW5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477gk6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:06:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899e89bf366so465852256d6.0
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097563; x=1773702363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=OnTymdilkYNAzzNqAHl+rQeqDUDAFAorSl82sM4b0Xs+dKQSerTTIPuMWAIkTa/cmI
         gqaImpNvr+KJTpLOR0AoUVSm9RY0WpvljPhHvH8Z+1Cc+jUuHCOZkniv8QpR4c5obDb7
         f14BZ1ykpWnDZyjJcNtzePEPdRptRVX/XVvqFt/4iojXppURdRWyQ5BzqElT7CO4Ru1c
         USn9jH6eFl2nfk5YhZo4cDYWTGa6+zyt9ifJmgsuznXDPaoe8XyQCVo69ymys04Y6oJt
         P+9zmJ2ALL5n3MBgaPyRlNJJIzC2EedupVMG/uC9pKH07xfKFmHk8p03smo/nJLvEwjs
         TDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097563; x=1773702363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=sIvK64XC9bwmmEXIpfr6AxsipdYxZQomT0tLKFhC37huHgbgzAwKSf84TGaiVUc1Jh
         JkzL6E9V5zfBAp+oj8ouEGD/QfXtzlXcvhQMYw9iJgQycMcIPxPupsbAXGTMStV+i7cy
         FXOxWNm0PmIg8fFMuyQGhq8G+Iowwdvw6lQr6L2MtJm221du/trzkvEgp3+WNRvPUxq1
         q+NMPt7JDXJL1W0FaQOIU+NXu02C1980z7WWYoDhY7SLCork0YpLfeaYifzUXBM7Vnmw
         ZcyjcVenH7ilNPsIpLPHHV4TF8EnR8wgAQOAY+Ik+iEwb7oP7uRLlazb7M5biz5s7A7o
         O+9w==
X-Forwarded-Encrypted: i=1; AJvYcCVzRX3sRpsGm+tN49RX4RSu/jpvENtUphr4JRLFkbJPhKcwZ/DrhLrEDAI2/UNtxt33PL6KtDQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzqqLueL72cJQpw3v1Fmjquw7w0y7zwnIHbO4kwoX4jGgIn0Ll
	vrLG7V07BALR7lbmexDMEsY0jWlLEr4nvBnUnX8c/dPxy+QHFtLf9dEouZvJgTY76TNcv/P9ohI
	KVppcvI3wouN0t3LoYDqoEzY+Vhfb6f1MChrjK2EZkqjXrKjuI1X79zW72qM18jNM
X-Gm-Gg: ATEYQzxBPph5ddoOxQ0k8vIULBfx9R7J8ohH5W6B9cTfKg1qtaaVP2kySH+FsRA0uRR
	jrOfCB3xZkFw6Fx+0aj1+0FR7FmWWx5IhxPJKboyJKkDcGdLvaFXV44cb9DKHLLRrO3sMM1G1wI
	q4to62RX+FFwg7glLzKmKn5SzgcUNAKOpFKkQOk0qOg2OYQdhkCmwoV/x+QVBSHsG7aRied6V/1
	PPBvhqFPvbuDVP9f8rlwBV0OKJD/WxcxWkFg4dbjkCr/AfM//SFMLayW67isV8eOqCL6owJz58y
	K0+7HjDKIvo5219kllGCM3+LkHSeu1kcAwgmnz/cKp97PgKQGhU1ARkravdGIYDaYz19XphR3D7
	NPFs4ZB5FD0UKcaXSO7EbDgemmPy6xLP67tXAZoW+0RVh1qEZjQ==
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568428385a.2.1773097562701;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568423485a.2.1773097562240;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:01 -0700 (PDT)
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
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:36 +0100
Message-ID: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXw+HIh3cFzWu6
 sdI1pi5vBrXTcxIIkGYs/dREKiqS71SDSUQszeBdLmK7YEY+f6qbUtXxrY2ZOij6xFjc9zajIZu
 MZMl+yqQNVjqtOrP53JAsZJ6CVUARDyirW6S0QoaRacCzLVP/2cfbnOdV1QdwN9PPldIClvOgr4
 ghtSA2J9tQPAOfMBqVs1d7aFIoO3kQzrsm8IOJ9VVFhfYjGrPhBiI0M/7oboD2QfEGIURXOd5Ru
 kG7Jn/r2Rawv+jiXGKBKZHYI3LC3nWk9CX6qSMj6ojXuEZFw6QNK8wOBHiAYU63b51JZQ/OlGEZ
 6zHLtfH2rzsJB03WaESJ+xuv5dA7VrQj197hed/BJiebD5xhSnfCaQBXcBH50aSrfpjY0v9jSHl
 KjZ9yXEkAyDRXTkul9wq8pb/Ar4B5suaTdj/80l+xO9KCsQPPHS4ffDf1EJtiWXIHxxVdG8nzxj
 Y+QFiNCd/KWZaq4boQw==
X-Proofpoint-GUID: b5bmxSqE-bpXDvfNxQS2R2xx_JNp-e9H
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af525b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: b5bmxSqE-bpXDvfNxQS2R2xx_JNp-e9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230607_728028_559F6CCE 
X-CRM114-Status: GOOD (  15.25  )
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

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 510b68cced33..bc4e1bdacaa8 100644
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


