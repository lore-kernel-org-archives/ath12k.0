Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D005C606A323
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VogQsKHv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J5N5AjjJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZVZ3YHZ5;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exvjVITJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=; b=VogQsKHvzMvSCX
	51cZ+f1D1CszmxHjcVSHRySuzjCnX04z2XHL2aEwqwIQ7jnG0qCrkE8Pj0aIkZkI9AJDEy3EHd5YJ
	XkWnZsHDDiQiqfgDY75vwCyyhyvOzvJBjijX/v2bOAkEcjK7Txl4jSX/IpR7tljFdt39DI3mOv4cj
	OjCn3r3dHFhOe0x76MwtBxe0sROy6/CPEPh24e0+ISwUS6+CXt8zrrFKc3KWK7S7HzE9gbJdg5xzL
	4FN8w97pOo2NZiNDfeSD1xX98w+4UqTJb961v/ymNqx7PGfo9FE7DRZ7e57O4wmIvRymc+tNUbMd4
	EoCqGOmLRftjNNZgdaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzUK-00000003CdT-2Jd2;
	Mon, 16 Nov 2026 16:23:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzUG-00000003CcJ-36ao
	for ath12k@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=; b=J5N5AjjJgmYQse8ACHavqypVVO
	yItUtpTOr0n7AkVB3NBI0pQmo5kXSBpmSnCwPAkQ5aAFn+NkcfIa0yaFUWEmxp3pAIDwDgmSz7Zzm
	Ts9RYmDaxGp4nTogoU38UaxnnNaWVSD1LNLkh32pX3iqi2NpdNbAeR50CvEEz7FInLSXjQXXU+ySr
	Y76rLD5hyayks8icBImyDnIP5LIJmoOl8hSZdO9YcT2oayJ6KgTn4d41pXkGsmsW2HDQbQkAoedMt
	90R8JiXk7jEXaOKl602gd4eFqTAqEBGqL7/OcpadyWf62gJki4OJol2VkLGWsQhJm66FHbA+Y1Bte
	nqQ3BuUw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzUD-0000000E3PX-0Djy
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 16:23:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIQ722789910
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EPho6yeU36Z
	5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=; b=ZVZ3YHZ59rK2FGx0nxxNalzsueK
	ClmYgIbnhi9BNOktRJNO8GHVNBEMgLHHHqXcPxVNvi4GMOLotmUfjxXjXI1/78s1
	ucWStiSfbicw1PMbIw304IpZC2pK3vRbvuC/fHmPxdrnF7eQVlFBZLqIwSr6u/py
	TbbaQx2zMOXmAJ7DmcaH6HjBlLD/GDgq7RCmnhoVh69cJ2ERq0oxCxNcB9XVD3vT
	1USdn9zmo6SfLRF3fsjYasmj/hKGi4m2RoCO2pwMpTkxgqgS99tfMLr0UXCr6inA
	M7irf1gkE0w3Jbz/mEYQuDvKBxb7mfRGxJynhqWAAAqN9eqbIL+Oo0ga+jw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfh7y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:23:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so3674615eec.1
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 08:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846194; x=1795450994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
        b=exvjVITJYZHH0mwjW/SF8VySyXIQsCG4Ajpw2EHhAVzF72UOXs1HH20JKfpZKShl42
         UakVsWg6jfqp9R35nQnuQTS+hR4dXF5U32DjCRDwHAs0Bu4iBsD73fdIw/RZ4aMujjBI
         /2ZGPD2qVhLmUUITOVUYvxI5VS5/nsFh3LA9we4oOIi900PerNFxL+RBFsthShtezj7w
         k56uVUhtPFVFs+9kJzPmJyy1HFiFH8xtUCsI4dKr7vuIr+xF+09Bs2UJVpfrNpRuf3uG
         3lDH5rweecTT+6/Q0Upr54mcnQiv9C1DP7nzbZKrm57NcK2yXQUEzjiwucUi0fG8GXUs
         OG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846194; x=1795450994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
        b=WE339OeA7j2gsTqObw3RBRF3rBg26TV74q60x+3WjlmBJTeYyodnTpEuuGxyNOpKmp
         WY9pYgbeiMpK1EuVS15f7A8uJFeeDuqCldLZzYbK68QMLAz8PTnOIXln4Uw3R26Z/Nsf
         l8kzah/Mwc54zF0VIWKwNz/GIX5vZxZ7CQJoAvMQ2IX5OPhB7OM5aJgbPpyDKlxUK9Yc
         gFxKTcs0Al+RBvfl06rH+42nrk9oUSVZLjHw2F3cT0UrnqpsEUzQI+zFZDRLfhkcQf1B
         Y2Or1zJNdZWPX4lnvAnCFZiI07DOP4FgUeZJVi3Sjw8AP9m+Quhzw351kg52I8WSzVPk
         JrNg==
X-Forwarded-Encrypted: i=1; AL+hErHY0P7g5yTDUImg7R4g5BHC10BuF+zkEWImx0OiBdBLF5B6Na78fm2wax+TOe8/nF5eccGJ+eU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/RlcCC458rSeYodkHnjYY6erJn+0Sd+0g+aA+GGad5Ong8SR6J
	RO/0YBu2dEEpM4GWBzO3iY1GkM4hSGV/WqGy2htusAEfKav/JO/UYrJkQ1dyGCcozfS3FcHhppH
	SmvDghU0l58ZB0ISdghaWKaFvoh0lvicIRIoua/V7KInod7wUq0avSqs0WUtfmeDA
X-Gm-Gg: AYBFou0530ls9nS0Q4Q4Hbx+RnoORjPs5WZcnRSvzI8t5ZuRjzju7Et9CmpgaGNo3xB
	oH3ItceNvFHk1giaLgvvtJTKm5oc4t48Ivu5wPR2SdIsDAzKSvKIK06NbRQXWHGDNnm/suq+8XU
	fvwPusH0yLoYdfEP7gEOVf+8BRGxYJkDslDdIeHm1GInoyRs/D+Tf+8QZVq1oCCsRL+RORrnRUZ
	vO483kDgYYDSiYcmQb9/4h7NPP93xhjbenwN/k/JRa5T6dv4IdEiZmwVvr3kEyT4UCrSxIhGouD
	RLQi1PwNVDcvV+Q78r6TWIL1/oxhiN8bKSHLFsKWcUP1/1bhAbX9GZZ1oqdJTqTSLKD4maAhjmo
	n3l1nOLE/VKRWSXu4mWEHR91DDPvFKzhaHVcIi6pAV7OYkKM0JUS+P5rrw7CFdWNJJskuaieylC
	ZY
X-Received: by 2002:a05:701b:4553:10b0:1b5:31e4:9970 with SMTP id a92af1059eb24-1b531e499a1mr2421701c88.8.1794846194086;
        Mon, 16 Nov 2026 08:23:14 -0800 (PST)
X-Received: by 2002:a05:701b:4553:10b0:1b5:31e4:9970 with SMTP id a92af1059eb24-1b531e499a1mr2421666c88.8.1794846193436;
        Mon, 16 Nov 2026 08:23:13 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:13 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 7/9] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:46 +0530
Message-ID: <20261116162148.2864501-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb2df3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tFPd4D2tFowRDCwbfnIA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX1t+zyYsqgrnA
 lv9BEM1WfbjnLAufMWtLqlglyET1zMp7ApDs6QGHdUpgstj/0mrcT4fGZlkADUrNM8UvBCpQztX
 4xbXo3mWHkuGhvWpqSwE1+cxQy4XAEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX83JOofAot1ng
 twOVrhCOuhFHKv4X29bBv8abew+cM3g8jFGAkgqJsblSqGHiIXpMAYFIkI0CZbnBRVl60kLhgkx
 R+aJfQZ4QV6ti4flgBY4aP93b0625rmaeS1r60NgcmVGl65Zjt6v6WW8JNcfnPwe5qtGXGF1Q3W
 dx0/9S8kad3iq4VpS0o+8mgGjFLKd5d/fRR32WfFU2HVtH0/1ozO/FiM1a1sc8JW+Z+Yq6it4B4
 lew2YtnZ7RQunyE1e5G0b9yQHzUmGXVdb1xjAgvkZcsroLQFdQ0jBOTEFasJAA1s81ndEkgk+ph
 l4hiLVZkfrIIT9HXYGzB9PnPE1ny7NPaLqzUSk1u8vB1MM5vHxtRwRWt+crytWmK7i5wqbOofbr
 oKGxMHqsY/OtTpwWg3WRW0ix9csQJ2TVQjarU38gMh/GwBst0ODpzWpOHoyZ8U5y0EqScazKJYc
 XMDEXk/d7ytPbLdI08w==
X-Proofpoint-ORIG-GUID: 5QALtKSypMT5VS-0EmgDR2vqzL7uwpHd
X-Proofpoint-GUID: 5QALtKSypMT5VS-0EmgDR2vqzL7uwpHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_162317_981801_542D6FAB 
X-CRM114-Status: GOOD (  19.14  )
X-Spam-Score: -0.9 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_ahb_power_up() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace qcom_mdt_load() with qcom_pas_context_init() +
qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset(), using a stack-allocated struct
qcom_pas_context in ath12k_ahb_power_up(). The non-scm_auth path
retains qcom_mdt_load_no_init() with the caller-provided mem_region.

Apply the same pattern to ath12k_ahb_load_auth_shared_fw() for
consistency.

Acked-by: Jeff Johnson <jjohnson@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8a3919675134..75d3141f968f 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -418,6 +418,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context ctx;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -451,14 +452,15 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		qcom_pas_context_init(&ctx, dev, pasid,
+				      rproc_info->mem_phys, rproc_info->mem_size);
+		ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -492,7 +494,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(&ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -1056,6 +1058,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1074,14 +1077,16 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	qcom_pas_context_init(&ctx, ab->dev, pasid,
+			      rproc_info->mem_phys, rproc_info->mem_size);
+
+	ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0


