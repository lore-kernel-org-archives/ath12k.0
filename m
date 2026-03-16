Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241C8F53D7E
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=oy/6a1pukHoHXYDrd5fXtGRGY+
	SXV8ClnD8L96r7pL7QGZp2SboSnHHNiQn1NiWht2ZZpeLIirfqbcGno/JPwFGm4fXvSlXDyIIbwjH
	Hwa0pW3J9blJBprtJsOG0xDLXjpx8/VvuDwB3tUXE/dWHoRwBkuXIg9S4oaCDIZap9JMDSliefODF
	+GLvagF7REp5HjbXsjfQxMehvv+bPMTXZyehkBq8FCuwFPy6vWkUgNZRqlj2fSC23M6PQkF031vlr
	iOsCL2jV3z73VFzdKHFW2Cz1re0UwDFRqny9sfftwwP3XKNq0TdZsDUAM72g43vZNJy1sdZlIg3nI
	+g4d78oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWi-00000004WQj-2jVO;
	Mon, 16 Mar 2026 17:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWg-00000004WMk-0VNG
	for ath12k@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=SihjMcq8II1UGoqqsG+kAPuqhr
	/9cD1asbllFaPFMJb78lHcrPRDOFbMdQhsfCGrQTrtE2q2HQOpF5Ex1bHlxZbLIe3D0fgTPH5d9kb
	jwVOklPUhPUoG9tM3OL+fQNjRKMnRyFtv+MHo7iA0TrM50/n0Vslasb+OTVCcyE0zv9jygBiKbyEQ
	8h1kANwNpOWeiJ9IwCS6B3SmgoGXrFYhtxP/xe9wXsE85jPiZ7wsiImTD7I7LpjSEJlhqV7IzIeVl
	rr13+VPfgse7kRJYDX5yWs0Q0/PVCVZs4SQcxPKzxd5orXgAQsclHIAAIiTUnftYcOgmxgvtAlEI8
	EmM9ayHg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWb-00000007INX-47yT
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6S4i4022283
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JbLYlc4Rhba
	fmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=DVsSgDcAKCTmEeR7blNUSxx/K50
	JpPXUhCOYXuK+aOwWkb5J5g+nEO9VT5fBX+8A+kFJiHfFYkae5jwOYz5xd2CDh+W
	zWzlQF6DjO9E+VAB5xGOEffGRrA7NKQsskBhnMhFhHMWdfJuESNFY4Awjhn5BLE5
	Z4zTDfL76Z1zQIRWnvwqMMGyxsEC2N7hYOU/0dATVMbpUIp+jxJiDr9Hd4uYKEmz
	GM1CtzSl9SJFqEuMBjmcv/KQhuJd/ANnR1xDVCrhJZPGDbk/16T3S+JSiMEYhnpN
	l84P19B96VJeN03VrJOLe+/Mz7nd3Yh2LwAN5/yGySj9hWp5vN0XahRUwNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fg8sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7c4ab845so2288758185a.1
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681279; x=1774286079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=HK8MQDCRjkGkwTHLPvCS79j5FXIhr6cFuy34yhgEWg+JU9YMhnHTCCEP02+9tuF4Az
         zBBMjR5JY640WpoFkCk5eHBFjL/QI8+E+7cdG4TH9R2rcNC5C8nyVMX4isLza4syvlEU
         YrbgPrcX3KIJyCsDGr0pib6+qrGjDhOPZvRm3xOpV1ExXnzKphmtbm5h1/rMgA5siRbU
         w2+OCvUo69eLjMoxWbOF/wonx9ciVE3gX7MD32Fc5oeMfhkKSKv3Mf5BqJQ4e0Ta8iXL
         490pGIUO3x/hySyn04qqyaEwWR5P4HFu2lyd6le50P/Fl5hUoZQHwdTbQhQ325vHuWw9
         m/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681279; x=1774286079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=GIoL5KIJobAE+SvKm2TRdw5osqQ9vwVwIBhKkd7ujbEJzkA20d+19s3slYFZVxWguP
         gI9iA2vTpjGdVMzQZEx8tfbXRlX0uxK/ELJug4caJv0gaZ5iIBIkse/IA5SQcxxI7ksT
         gY88oZitcPwNPGfra8Nq8ARq/flUCU5tHEy9vhRVuqdSERBkKCEbitVhxT9NFCyvyBZd
         RUmTYp0pSqeV5jsjsSn34/J8H2/udkKvcQaqE3XijFrXoRNiWXiwNvfbbjt6s8/sabyn
         sxwn9d/h7KgXNw0xaTCebXlWfW+J6no/gGpuqVVlJ/pjpqNMIhC6L/+x7lm5nrqwASec
         pstw==
X-Forwarded-Encrypted: i=1; AJvYcCWf5+V0ZYVHqe3+fLT1Efty1VVm5aMVc3z4tFGERNjUYDokR6m6azQ0ssp+xElbbnaUd5P2Iqw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrFOnPLDAmSxfYH4F4p/Oc61whx+aPIbsbgnNMmzz7RLPVGwoV
	/NLbHJExNQr/2BXa521YoZFb7m0rgnTDX/RiJ2hdGnSlY1NzDTC027HEF7edUjrV92lo2GdmcvJ
	INtrCTqpuxnUy519CktAe2fMcRBkDmV6itjsE4bQR9AcSjOSG+aJGBtcwljbjb36o
X-Gm-Gg: ATEYQzxmcKSKP8NijbNrlpZ22OFQUiFLqzMANkJfWhyc/v6exJ7BgNn8DFaeOzgHm46
	kw+EN2ocKinqP4yRbqZQ+hK0WYFhX0cBfy8kKCua1CGkh66llgOerBpFScyw+fupEbvZHZ5W7I2
	UsNoW5LriQCxn60erGSXRoHY1FDzrFexnC8X3Sdka+MWXxl3ZXuP2dZZVjdAz+1DEz0x2U+BMjI
	icK3X33psZK0LeKbqZQ5fZL/XlwsRRVkXf0vQ+wICLatHtunl+pjLWRc058bG0Didr1WdaxEjWc
	jSThvBC7ULdKIxyJ6ZEA0bkZRqQGRAyIxSnPNeqajxA254Z50409XSgVHsuywQwfLmUbmT90p15
	XO2zHdCk07pN8GQ3vX3B3tcpv0dai0MCE34xVsMiN+UbzcnQ5OQ==
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859177985a.49.1773681279617;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859171685a.49.1773681279092;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
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
Subject: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:11 +0100
Message-ID: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b83a80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: MbPCBotO3nAoG0udIgSI6hPu5WVEqCOx
X-Proofpoint-ORIG-GUID: MbPCBotO3nAoG0udIgSI6hPu5WVEqCOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX07rnasqWdEpK
 sKiJo8zXTvvYtBiehQUrm1+aeBfw0aLhkvM+518BG1UZvNFBIRHbMoM0I1FVFq75nNfMd38zYyZ
 qlJSXswIH3dj9ZdW/Gmw5CQ4rXzeAXCYv61Flvg9d3QdUYeo0FkRuyixMTsMBOdaphXrDRICxVg
 GTwYSEKZPpClLyT41tsyifTgp7Ims6ORcC8rmi7PRpLCiSlBGSbRnI0H4ep+Ro+xtDSI6sdsbiP
 U9hHXvs9z7haEEHUduLISx6otf14XHGwijGy9LXdIRnO21QuBcnoPt1LRtIPTHUVGUk1iQg9/kZ
 kNN3WjilQ4EoDZ0bVHC6uFyQ6TiFWNKc4FkifkjyIbYWKrvG3km3C00J2UEUxnUBmDdpA3OTpsy
 MORwnRUEqlZ0puzPZ7LDIA8VjnsJ7NTWSyK9BsOmwqv/HWfwdumntmwB6fG6cjSXJP4ONC/f1p8
 s3OSTeuqQBx3Rb+SB3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171442_355394_B3800ACC 
X-CRM114-Status: GOOD (  13.63  )
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


