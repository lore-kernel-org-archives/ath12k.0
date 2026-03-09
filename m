Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53F3FCA19F
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=ywD00Vw4pZurX7qQcX1dN4mNh+
	i7eG1dItHVvYanLXAirTO2urzrjQ+ghZJYvHBgJyNUL3kaWJHU9xFEL+ptan/6iUSpIk/uFzdnaj/
	D8t7JrnvJmoYtxbjYALPRss1bC9DXsDR7qVzsLkRc9/Q5RwJQfQXyW94/6lnB0sQsUXVoO0J2sZEU
	lOvXk2qB5Saox8TdUYAx0BWYctwlqwBRBdKCIcE4XHG7rHE0P7I9KmafoniEkdH574QLwiRXMXKdY
	8U2XC8c8uxjnm+244DZIOBeAxjneV1le3OQd4/0RmjjevPkHIsBwuvQ4U96xBCqZSd5aqFqPzeNYp
	qxTgcG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfd-00000008Gf6-2akE;
	Mon, 09 Mar 2026 23:05:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfb-00000008GdE-15RY
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoY41920926
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PTfKdHxXDsD
	Bf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=lBfD8/nsjfep7uWpNTtXTTH97LP
	adqHrnvrTVmVgz0lWbAL5VcrdHrI4FRTSXkiz+u1QcKmurgn/d88hHz/4iBBAoj+
	SgF0dP66UX7GP3KqmHq4FBR51A54fIi9wNxDZIo/awWFssBbLgEaNe0j8xL0eSu4
	6ohLKXiqBj9NRM3ztv9YLcdyDch7tWK3LyfdOBKXfoqDRIixooDyqouwjHgLJuOl
	Z4pMUTPjrfg3DUOyVZm3GPKNXh9IR5fH1JW8M+0dXX3xAhqbHxUTvP+UD3hMdiGU
	wmJYD7HdlW4rfeiSqQS1ja79m2ZdhWjJOgTQi0iWoF0sex2KenSTQG+ihSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81uvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7de0e161so1264070785a.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097550; x=1773702350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=kb6k+DbRAGP6XCXyUnnLO0cLUyf35S06hP7k7mSUu+MrE2ruwdw7gNlSSgvtcX5oLG
         qKOhd1bTUNFBmd41VG0rnsjaz8bZke7842MbQma6DY4zODST/yrv5+PcmjXFJxS+2LWV
         HotH+TbMVfUSRPqpRcYI0ANuFjfOL3KhcV4xqSQ7v4GTsNz3I/XBd09nfAJwHCJCtfPn
         +pVxWI8sJ8cCj4+oUTssy1yU99ORV2KYMHOkbDgY77hhqEIpyo2cftDkBPDttPJGbSWr
         v6ZHhk72qMPvJSlz3qAefareyKf8tUPPka4o4YBzerUsfkPx9pxH1zlNe6Z4PUz2AjWM
         +peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097550; x=1773702350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=EJmKfUrFkJMCIdb7SVl39AUz/qVsFT1Jr127YSt9z1nqKudMpV7aWzjYLrV5pjUKdY
         86PGgwd6Ble8d1Jx8MgSi06Slsc2L7V5sEGhqJ+duE5Q0+aAW+jolbW1j6smzkPwfDyA
         CM+5nTijnr5ZhWG0J58jxk/Zcs73tjj+nlxev6hl5WPzMhYwyAXYIxOGab5UAcEwPltT
         +ohoCCn7QjmJsCcfnVa23MCglfkwloC84SP5VnSfE5FQA5ykCR4STgeeb3MJDsI0bMip
         SvHwAqtfs9R+5LVPZRJdkSrVwtKqFcI04+vrXNxG7T+QIl5qTf+x60h0m3Zbf7BtERW8
         uyxg==
X-Forwarded-Encrypted: i=1; AJvYcCXRjrX7iQlidaucNQSBjEY3sfMk57EkH7MI1dHC0C6u1Mi8a68o6XmFpZ00u4eNYutCifviSks=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp8GCjhWrsNoy9kUCZcYPABw/39U+IY4BSF1NmVOR8Mhf1aUzE
	0g5VEOPmUHy+zodeS0BwfO5z2vEq9E7gdG8EhhJJQp4xwzmXHoicfsOo5d4GTKhLJkvTj0BiQFb
	F8ZOgbqXAURuv5T5X/ntXU08DsNO5IR8vNicmHMjjEsx4MK2VkdiHXKnBA/Q/3jZl
X-Gm-Gg: ATEYQzzbTR4Q/1yCaUhw45qqjKllfzEaxpi6Q7yYQCHJ9YQ4Z/clYR7ys58LIkNeuPh
	lqmXYXoOhj2PYw4YACOZNMMM1QVSo+w1j+fXEcQEUBwKuif4lrgeqdPq4zhKJZtm0nwMG9xVhBM
	BK01JjMkLfEmCHckn6HDGSY5fWFqleRPow7fq3n4PBpKutDueKjXbIoTA4aI2jC+i7tQPjMcUcL
	v9rQyYlLT/X+Di+Fep5dlWaG5wN/EyMXmSmlfjfMHXUdzb6bOaz+DTi/EulYsAdNP7tlCpoa53z
	MQu2R3jeiZlby8CvSjEUyemYSTt0MpKIlmwJUunWSU4LOJM5SQU4bLzZpyADTqPtf0165RTvIpZ
	rZxEdZgQdVQLCjFLj/CTnheDSPPSemxxuEqiZQVKClxYCwVhjXw==
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747204485a.30.1773097549741;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747199885a.30.1773097549238;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
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
Subject: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:31 +0100
Message-ID: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af524e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DzUSqs95-hAo9BmvKNrYt7W7_rsd-y1K
X-Proofpoint-ORIG-GUID: DzUSqs95-hAo9BmvKNrYt7W7_rsd-y1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX32uTDnPUipO0
 k6RUfeA7fWvi6p/OXD5Yr83OAXqudh1Qds97x3rSczSTA5E2K8r7GjrV4enRla1Rdogdc+vDeIO
 ylkVfp9gYM6isSkh7Fgrm6bU6Ce/omQXnMrK6LxYua0hYXgm2I+U8EojxEEMfsou4JshEc8GJ22
 TZoD6w2M1cYWCnIj9/CSsbGWF+lcuEW/SsiIy9U6rtQRWekqDGs7/OORETgiiw7BypBpHII7pBo
 266jyLpeVQEN9aBzk8/ICRvti2ErQ9mleC/Se50pjMVZi7c2qaCQM505tyXdMgAT61c4JTKrBZL
 aCzSnj5Lb6+qaLwYSF4k2YmW4OPz7TZ8wZbL03PqDzAbtneR//1JHGrJRwQs3o4R4o9R+yKgbio
 qa42dl4b2Ve53KJYq8cDnzOKvG/MAv7vwh5ddAb5xD2JmopXeX8kfN5sieWyqohTp96J8zScQns
 ZJbYbBj4NAzgnWRYSPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160551_298270_01E8D279 
X-CRM114-Status: GOOD (  14.20  )
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
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0


