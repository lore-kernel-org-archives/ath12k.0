Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D10F53D7F
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=tXua+lV2qCDnVx18eZSiIAwDOv
	AdYRoC6/oCz6BuEpBncjeSULkfFxd/UI7ppwMuDFD8aEoSEPzRefaqoJL0o+cY88W4Cz/xz+wb3VW
	KShYO7TEBnaewqnTATemXMKrXDCRmp4bGCVMzx285OMZjQ2Y4sKl9oqrr8s8+aKH9PCRMgJK0iFuG
	aggu5PtqWGRW8jTl7rE5dj04VBnwfmYelBI8ImR8ak+rz6QE9w2H2IfTA4jy+qbS4iF/kkahfqFaj
	nJLhPHFNbDeP8r7YiSpoeG76V12GIwGJYHg/lkfL547o2wlErWqq+adTyC04GlLMsbzjehYTRIW3I
	50uUS4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWi-00000004WQO-1TZb;
	Mon, 16 Mar 2026 17:14:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWf-00000004WLr-0672
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GEg6di3295188
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFXy8rqV6ZJ
	yXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=P3DU6dl3c9C+mKOoFj8fLnflTRc
	E4S7OufGIBneH7YqP+NWIVKQr0JamAB0ccP/h1Fu1YGnyp4csg0npjgoFeixW8JR
	Vxl/OXVJfgmTwzF4Vn7J2fQ1stksLuZyNanswJjCeX+tEvcw4wn+3J9ef+QTeG1n
	nsaaszMiZ/kCXgERsFktG+NFb0XemxxH757PA/JfVm3NnNUUQzrGnDx49KGDygK7
	pFlzs5B2WwtrEU11sYGr3Wy7XXdUOW1/NAVcRbrPi0lKxckc1uUQdMkQ34QJ+ljV
	4HrjH64gyE1cItzRHI72edpT4EBGjx60xlN9Izp4/hJP4ItIfIEv51VQ86g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy0jgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd820c6a4fso4310828485a.2
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681283; x=1774286083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=CwiMDsRixXCWSns9lEm98qqzti/zREw61tTUTnx5Y7Nzfj9aEm7i296UvHBVnfL/Vk
         6qR6PvsZudccFn+FFcWspUPKzzI0Aj4kamFKohny/GeNrPpLDePYfea45DInRdzRGG45
         WLu+McLmfl0nh02VYB6HT0cK6ZIgcTzjCAC1jGLudj0+eBk5mPm00qGdB7dUVd0CEDky
         XQornDltC0JRGGH5ltks2Hnkt19JVDaI7nb6eOXOULRJ8GwUYJcpoA0bA6he3DS1Ny9i
         5owxQCsjLySeRZ5ebIzrC736ReRkpVmHYrV55pNO/FvgUssRHyjQWXWjbSxrZnk749b4
         cQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681283; x=1774286083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=lC11k9MR+MrqxOWJqq1OLjEZl3ih7zeweMfKWIOENq96AyTkoe1Y4JB0wS8yxe2i8n
         GHbmqoFl+iv3LG0+r27e57Qursv2kVOYvUhc03hl3+D9nYVODFVuCsZKM0kGfTjk2e7O
         4U0+hwP0vMNRhpQ7Ua/wdsmX1sIUAwz4EnB6imiNkY5Tn8FD30onAHSP1e/4wwtjrtLT
         xuXiKv/2xCoAPR/GpeDLQTgUbXVAp7ss7flj67q8g5M7Op7jKyAtbW+CTq+x+Daiko5G
         mggkgupirdmYoSxd7GPeQaJvZQz7xRV9NPMDoXtr/rVYH51k45GMSJ/O0blUaJM/TMtn
         TN8g==
X-Forwarded-Encrypted: i=1; AJvYcCUED7nDYh/OigIJy+SByJXUQxNrs9pzF7riPGkaBkERtD1/K24uMxK6O8SGumvduYSRHo+pnSM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu0JDgMfgXaqhQzC+pNff9TGhPed2PnQpV2R8EoKsbxtE6IcpQ
	rhU8PprC+sElumo89VlXyLkbRfm9NYTQ38vRxKJkGYzEvWu5KcFi2ywq2pP9xLbp2sNgHFqgKVp
	kCvqrg1R2AyMPCwg2bXYS83kefpobLTip8+TTwjDh/k/xAIj0jtU6LmzLB7bRTVQa
X-Gm-Gg: ATEYQzz0nqBYO0nJcIuS6Utqf6v0Hl1SQ1QtJYBA4SMPdudyBz/DrQGjv/iwkZ8Paof
	iDnJ6Epk5muGGBwZbiDNpjxdzgOdcYFVgO9RyzCWaZtTjo1+KqGnARL7/9oykWKRLbSLApcVDcT
	so++ZhCFMKH/Fkgn1y6XCilSWv++nGBDIK1PX/IqMEkOq+YUkHiW+lrggoMWupoVNcWAwOJyBw5
	VduC8gJKhqGTy7ZiOl4XiD6SvQBwgrqPToqH32TM/qzhqaUfu4OVboPG10I3vmqFNyC/vifilMt
	1EPkSDyt8zhRfuO/SNlsdEBjDoSorUxXelfAOc3FT/bFIqUaddPdS5t0gUdRr93JhbTnzYW0lRf
	dhdNh+SpFufdVozJccq6/LrkqyrntJQ2sxiLwYJfaAH2ho2MptQ==
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839478985a.10.1773681283379;
        Mon, 16 Mar 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839472185a.10.1773681282736;
        Mon, 16 Mar 2026 10:14:42 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:41 -0700 (PDT)
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 3/4] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:13 +0100
Message-ID: <20260316171419.2619620-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b83a84 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=PhtMypRRY1SmXJO8NnMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX+cHtClRaYeAI
 /VsAF7qzuBuUNlMca+wsbrVoIvrITP9W2k5FEJAhMX8Fpyy7WH1m5/cN0fWCJSUoPsEsdGMl9iV
 L6c6gLTL2VXX46RvzZ3YYs0BjNJuJ9RrYV3J7aftVRq8UelHxsH+RaqVFfAQw/RY3vvPTercMIu
 E0yu7XXD8zVmNjEjAOEUWtxJZfrTR5KaUrQ57bH5VB2h2lqv8DRQxgTUZd2ZvPQBy+H+9T7ndQt
 yJOAGI1YkuuxCNH4pj7RY1WdjZh6XIdC0HneWtLimtTO6P44GBQ2BsUpPBaCkHJ8/1x6YMKTIZg
 FPusWIbNxStuCfbbk0PNbNZc/nsu0f/BfbXkMrmoKQe0vxAbtOpHkyzyU7ij5AKG0BjYJU6t3AH
 0Gt2fWmhpF7S1cSNm44hxtL6LFtVJIYPLU4XxkGR6Q+ha5blVxm921zx5aUcQfkfKYc0CwHL8CN
 fAzZIcaTXq+1dHj68oQ==
X-Proofpoint-ORIG-GUID: ClYLy8fN15sPPOg2GOMmISaaueEPN1rl
X-Proofpoint-GUID: ClYLy8fN15sPPOg2GOMmISaaueEPN1rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_101445_179733_B25BE2C9 
X-CRM114-Status: GOOD (  14.05  )
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
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..0b88b8577bdb 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -48,7 +48,6 @@
 				NGD_INT_RX_MSG_RCVD)
 
 /* Slimbus QMI service */
-#define SLIMBUS_QMI_SVC_ID	0x0301
 #define SLIMBUS_QMI_SVC_V1	1
 #define SLIMBUS_QMI_INS_ID	0
 #define SLIMBUS_QMI_SELECT_INSTANCE_REQ_V01	0x0020
@@ -1408,8 +1407,8 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 		return ret;
 	}
 
-	ret = qmi_add_lookup(&qmi->svc_event_hdl, SLIMBUS_QMI_SVC_ID,
-			SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
+	ret = qmi_add_lookup(&qmi->svc_event_hdl, QMI_SERVICE_ID_SLIMBUS,
+			     SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_add_lookup failed: %d\n", ret);
 		qmi_handle_release(&qmi->svc_event_hdl);
-- 
2.43.0


