Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E8FCA19F
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=IvLVslZJKmrAWOkeLHJlhrDaeL
	TgiK+TZdYgrF6oYu7AZBB0yvZDzotNuCtInqG1Nf9h7/Od7GJZgIyyNdSQJWl+Z3qTF18Npq9Gso5
	5HxgnEX1o27t6RdvEqdcew9xuiaxDZwJukz0epFTppZmkjR7fE7hritBEBybPN5K8bGxXD64XFgph
	tq/KDdb84IvOwGyATScN1xVkezfbZsF/mJyNwFMB3OC0NWqBz321NNgAabWu3oTBdalxpQKHVOnuw
	OazPdDjHPkQagcMoSUPs4C3a1Emlit9FYS96KUct2KiRcihZJnSaq3q8UnS3a6anHYYPpCZzY0Ena
	ygSPoycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfk-00000008Go3-46hn;
	Mon, 09 Mar 2026 23:06:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfi-00000008Git-1A9v
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC46l2428014
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xPJuWGqmD+8
	ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=ifd7yez9Im1NWd4QlgNWMkyW57W
	tVINyWDwUayU0ofvyVrNXpJlPZbi5BzPstvukcndCx8+sBUFqHybdIZIswuEEhzK
	zmFpSttCgyQIzDo0Uwgdl/0FaMmmN1EjgnaCA4AQmAxAFh50YkxYu49Gn997mxRc
	S575adbLb8WMzcm90Y2nFu6XMVgbx1fF0IPOGRUXNpT3vplyiumkPNTVWF65gXp6
	n/mkmfTxImEfRtoCU5AyWCa8kx51DE8gFX6qwq2zP0hpXCvTgGH+HKqnmqVBKNzL
	PXY/qaHQigjhC7ZOOOfC0z4CflOArbZEHdbza4Mjlv/EpfwKbVd4mpZCysA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eks91m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81506677so1046168285a.1
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097557; x=1773702357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=dGqLow433Ld4vMxZP6LDRT/CC/lWhBpLWjl2q1BBKnH/NeBKIh+g5rSncCDyWZYyX/
         wYDi0KT7nhXJ8bR8mq90TmWSa3xtoet/0qoT7vJXvDHNzJb4UmHs4SkoErsoaeMiFGcp
         f7tY+PumoxmemkO2tjA8lUG7tNniMyFHh1npKDjdLUJW2JUL+v0LQQY22uZHbLUZ0ljP
         Ivl2kIJ8rNTaU88UNqMAI8ktM9dwINCrK7vLglK6WjPEBFYA3y7yEHo1kv5eQhEetrR8
         XMFHj1FFabAlM8m1f9xTB9B/VQhwV/kjg591qFjjVmF57DtRLF+xieSBdNGTSXkSqhIG
         RhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097557; x=1773702357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=a/nJR2ele375DoHZ+tvsacsPQFi27me61qe6OmsDANMv3sgK1HIKhtqJy1qKKRNEDi
         o6La35CKCZPnc21MJHXzjD2ZWD+DWSHtrpmVIzMjs5uS81jyvzCvToM7ekHKWcEasMWe
         aS9AC1tgfSx/UcXgu4n2FgStQN/1r09BvamO2X0iuORkzcDwTa7bOwRZDRBPLonfEAp3
         p/bMZ5rPC93kgCCurbTLQ4Pmw9P2H5xhVzYOlxuLdJB1AkBk77MHlMVvciCdB9+GngaF
         4AQIf6Lt9+W8YfOb4PLaMQQGD+Uu5tDZ3H+Z2f0UdqwJQHJXLdljjEvG/Lf71y1DUDxc
         hI5g==
X-Forwarded-Encrypted: i=1; AJvYcCXfBDiH7mYO4lPoc+FK646Gj+2d1i8AwfNyulKyZi/vifKtimWPKFuwffxQyxIrHZmP8P2ioKg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdwdt0yyVgVJGgEDnydc3MdmwT0Pfli+yM2ssb+oBTa2F2UZ7r
	/hofVxZLCKyo7IUiVxek2kIqk48jYIQPPlvPFgXoyJnTS6RHY8DKBWnDJfBwDgAwOXg+p9HgxBA
	kb1z5ugfVSWuJldyYisike1ZzJ6u0zgjXu2hrSmhGllXw8IKPNbaeEC+ENwNm5G3v
X-Gm-Gg: ATEYQzx9OCRNppngOC2ymrknA/lfWVZSVBbAwLG8Wph1yTC+1nM1ChPIFK9d8ExrROn
	XAm1gutfrxxstul+MsCK4kIpQYaWmNcxyNB5u+ZyFmB9JWayZyKP8c8ASe0f1NhkS7tfXyI31dW
	Ycflm1KAVHeci/KzMIiQMv5BDa5WzpMO2SaOV66NOuzA1RPobLlQE6v6n9ZFXu08iVPPuBHYD9Z
	hHfxUY0lsCWo1iDOBFfT5MTUSEvD3DBjX8GizYcSsMwUAmdq0XOfEccUjWIcqmMzfLaidU5dxQb
	e/SKYjyCg84BBy1FcfDw2vmCkEpOoRO4aVjIhFjn9QHIYDN3LYmipjl9Wh0UU24LR+OOcgSSFR3
	7HtXwH6VbaCrjk7zMAx5Xyxd1YaDvb3T/ZHT4wwPiIOCxS/lLBg==
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673413785a.58.1773097556802;
        Mon, 09 Mar 2026 16:05:56 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673408485a.58.1773097555998;
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
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
Subject: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:35 +0100
Message-ID: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o-oM4m0Mdgbk9SLBqWaWw8rqcFOxnDu2
X-Proofpoint-ORIG-GUID: o-oM4m0Mdgbk9SLBqWaWw8rqcFOxnDu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXyjUNA2zrQLPV
 YZk9sYtES/ud2qHB78LQ2XQgxDpXNEUcJtJKsnw6h+TncYLVjIOLd4ckmlpsBVytFBreqKvndRf
 oJsKyeRBDuSM7Pneg5ezRYB3XqdP0mIS8JY8CSz7FsjPV2v8DjXLy8arE9HvUko4eTnPQLZwcBE
 NGKoyMAoCvcEvzZbflIwz+5MKDehLYglOGClj5GLjvAihUgHSOcg1VDf+Jdrm6UpLoLr8WYh3CC
 scke5k2bu496vNb/hYnePp/zObs2qjJtnKcq1NKwWC3J6N4Meh5nTLriF+AMQOhcSiR+ylWbUnZ
 rUseegxk+FlR8Yi4e79Q5bh1+XMzclqDYu7ACUWcxAGQ9kW5xM4l2BpNeG5a1qEO5TuqDzvBV5e
 sGEnq8qPH/ueh+Dn3J3WYV/zeCacHQJwegTU/1grK0Lo7AtqQIo6wqu0osEZhgbMKQbTfllOTz0
 8MQF17Mce3SaktT3TYQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af5255 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=P-X4VuwvMnWJEdMca_IA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160558_325178_6D9641E3 
X-CRM114-Status: GOOD (  16.19  )
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
 drivers/soc/qcom/pdr_interface.c  | 4 ++--
 drivers/soc/qcom/pdr_internal.h   | 3 ---
 drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 72259f489075..6d879e1540b0 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -523,7 +523,7 @@ struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
 	if (!pds)
 		return ERR_PTR(-ENOMEM);
 
-	pds->service = SERVREG_NOTIFIER_SERVICE;
+	pds->service = QMI_SERVICE_ID_SERVREG_NOTIF;
 	strscpy(pds->service_name, service_name, sizeof(pds->service_name));
 	strscpy(pds->service_path, service_path, sizeof(pds->service_path));
 	pds->need_locator_lookup = true;
@@ -678,7 +678,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
 	if (ret < 0)
 		goto destroy_indack;
 
-	ret = qmi_add_lookup(&pdr->locator_hdl, SERVREG_LOCATOR_SERVICE, 1, 1);
+	ret = qmi_add_lookup(&pdr->locator_hdl, QMI_SERVICE_ID_SERVREG_LOC, 1, 1);
 	if (ret < 0)
 		goto release_qmi_handle;
 
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 039508c1bbf7..6cd8cbe26822 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -4,9 +4,6 @@
 
 #include <linux/soc/qcom/pdr.h>
 
-#define SERVREG_LOCATOR_SERVICE				0x40
-#define SERVREG_NOTIFIER_SERVICE			0x42
-
 #define SERVREG_REGISTER_LISTENER_REQ			0x20
 #define SERVREG_GET_DOMAIN_LIST_REQ			0x21
 #define SERVREG_STATE_UPDATED_IND_ID			0x22
diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index dc10bc859ff4..bb60b5c40554 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -656,7 +656,7 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 			goto err_stop;
 	}
 
-	ret = qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
+	ret = qmi_add_server(&data->handle, QMI_SERVICE_ID_SERVREG_LOC,
 			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
 	if (ret) {
 		pr_err("PDM: error adding server %d\n", ret);
-- 
2.43.0


