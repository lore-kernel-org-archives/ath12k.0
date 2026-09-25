Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B34C98325
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=; b=yOqSBW8cTMWOtzzxkqCazRxxnX
	bpgKkOz1gpWQ/9ckB2F2KtV2m1DWtxJ5aPmlp2jDvOIZKgrEHRt4pGR0ppwC/7yEMU+9p+BUBRrrO
	izOI8AYm9mfd6gKZV5wcjLfCux1dH1/6hTvB8JVmd1MyvFkaiKxI8XNjmy/j/1+1YNcikemsRDe8K
	P4m3BuBUDlG0mFG9sWaSaBAovSJWg8o+OBvqWOfCJhXr2BsPuv9+QFHswFliW1O/JV75RsM/zbk33
	LAMn0y/gK6jEke8oANT1ElKDMU6gYeu2IbCkWZ09/Rwy81R79tgXCo13UomKu4wOsnY4Wynq61mIY
	i7rxtT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8KL-0000000DsrB-2pjN;
	Fri, 25 Sep 2026 15:59:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8KK-0000000Dspc-0Dn3
	for ath12k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=; b=p3tCfm7nvDeKupWWp55km67i+n
	WZFkP8ovHgdWU2qwYr4ww55T6HbUXQM4GyNlOqYd7Mi1pVEWF7I7plvLjpps+IRRHnxa2+aYAUOO/
	da+vXdgR0ujRtiy/u9ttx6qSvYetyDsJ5HYkYs3g5dK8bYXFvyDLZOWuEArdSqdccrPE/JEA+eDGq
	nZYluAaoNu3nrcsL/OdSF7I44VhGOduVmIN+HQk6lk4TBs+j34wB3o8bAS3jjMhM576tuxw0OFVrl
	F1pnnu/SFEk6rcLzmCDl6jDZecPQP7rKwUMeduvIPuHYCOFXM995Nzaytz5io+VCTtMpHq20K4OZu
	eFDe1pMQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA8KH-0000000H6JU-0YkE
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:59:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PEKqeP600642
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+LQPvJJTeU
	1GNlByxbclHTDDGT157UOusSi7k44uBE=; b=Je5YtJ+ZLvxiFAY66mMnDfFDIQN
	R9qeiE+x6COa9tg25fml5sOLY1QiFg24hhrXIruKfUNtaKbitUT6no5g0XOTJOcB
	EFcm6/LaLj3XVn595RsvDa/Afmkmw68JlIvx53aBg9smhjQ92PhP5ZTV6tDmqr99
	21njqzbQ9k/Lpvo5QnrpunBoc4FaTYMtv0zGxTJl/RiTfBOjIsMnWiACLxLUeF8L
	wbVas0Rf/I5utcdI3brpB6B+TY5M/+QWQJCNYcAjE3hu/A+sNeN/qyXRM36f8aVe
	LKgfdh8K5Ks0+olNeJw6im3zs54wUQhAvbbMJ93Gght8pmCmfSMFmLMgNHA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt2cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:59:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a74698972so948670b3a.0
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351942; x=1790956742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=;
        b=Wf+owqSbCOSUfbgUSb17T9Yi6EZH7vvjO1wmct5Vs7Ul9NrIAKIsmvQpWfCVa/4GI2
         zKx/Opzh3nao3ha4Oqcmj2pHXuHDblY32NvHLWRdk6anpDOYT55EHmXAAZnwzGkqPfqg
         ohkpcD1+AgOHc0OETiWsDJGLUVkx92stidP9eVHTPs37k6YaRm1LxSWalZUHzT+kuem8
         fjeWE9la26xxvcCQIk0juzTlTMfPD6wvsHIGhfNGtmCuDqxXaf9dyypWHNP4Wq8Em9yy
         vnW3pndFYc60uphMblOrE0nhV5S0rFkSS4/d8MRBJUsFAQjoi0hMLk9mbVAHPk+dm+pe
         mH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351942; x=1790956742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=;
        b=naS7ExwGS+caFOXJnM5Kp/mwFUADDpcmCihGyAAKbMMMTaz5jJdLLh8GlHR6TEBA+P
         rrWJhbUwF2Fab6HL7luAstM3NjYB3VyuGn7SgsFsX8SfjKBYOjf9HCuT58xnildZ6HGo
         qio2ejcgBj2d8elDQyeha0ZLCbRDfrTxZ4eqvfL5u9NZHrL9WVzL1h/a061NrOeveBEM
         LZcaNXRSxfLYCEs4qWIU7Z3YWSWLK1v5PmmonpqosK51k5tA7IDqwh1qGm3wPj/xZPER
         GDgoP6YtCArteiwx+pjkKufAnl50NeU9tj6zy24CwfV8B6oTFY3oaLiCLmSehS1XhXt4
         LkgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoEytIySwpWlhY93X2ijLRphzbNiHF97zOF73Arz2Tbk28Mr4PlbDVFJhe4osp+SJzIH4zQq8=@lists.infradead.org
X-Gm-Message-State: AFuF++k48/YvRCJ1rOu/Uzsvi/iQCzdu0Vy4+iXRnXsoLxrvw6nAiXr9
	TT+CAov4SZ3TYtU9ewwe8JHTqBPRdP9gnxdGM6ZWtNnfK10g+SUFvcLCshy5//dtWvQtzbQKPol
	Hvz651I3+jocsahzmkfx6kmtnCy0Pfq8E1eSq1h5rU/yrDVyAOb4anU4xqOt0NvTD
X-Gm-Gg: AYBFou3v9DMcyxyo600QiVPrHFVwcYir/9GcgyVx2JwG8oxSUOswvb1FBLe+pBPY/H0
	vh+MX5zxX/9gj/ezD3yVDm05irfv9NAdApRFlf4xVbV14y6Uhsno/gvSeGKYsu7M8y4H1vFaz8+
	oO9YOcl3Dtk2uUveDpY0K29xXUma2jPbcWB3roe5tQCU71i7BPzrhKuDujK/HDSbP8dm6jaFpPl
	E+Ya3gAD53EQIgq0r400r3Pcri4//wjINTzerXPAwahr0loKQN1rzHLhRhTeJT3y7415Qk+5nNS
	a371TzOdiblaOphZzHynUq69PiUBptIJwhQPzZMeIpU/fcLnlLX+DwuAkifTGQ9FLeiBaAsckMu
	fy3gBAmQSiM1UQJG/ynsDN98xgo0=
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id d2e1a72fcca58-87e9b89660dmr4973909b3a.34.1790351942088;
        Fri, 25 Sep 2026 08:59:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id d2e1a72fcca58-87e9b89660dmr4973873b3a.34.1790351941480;
        Fri, 25 Sep 2026 08:59:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:00 -0700 (PDT)
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
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH 6/8] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:35 +0530
Message-ID: <20260925155737.4161358-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G9S_mzNVxw2yfs9Dtcs1mRJg5awxTWyY
X-Proofpoint-ORIG-GUID: G9S_mzNVxw2yfs9Dtcs1mRJg5awxTWyY
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab69a47 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MUQpB1KlM5cd8qnWRq8A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX8a1Couax61G7
 ksuwje0AIinZMn/TovzLmuPL2qhjHRBmj+aIc1ztya1aFk/uXPpRgOIHKdptov+ez+atAS+jp/A
 viQao2fsyFQcreax/aT2mnuk0fKeyCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXwSX52IkZGmaE
 0ccOvMf9VzOK39zcYozMlC8Xvo1qUIiLQNsHZ90pVUPv5ruD6nF7aMgzntw3IHsuTWsAD9q08P7
 dHmiZQMpCDguCI3SsJMYKnT1mUd7TJMK6Qlzw1bNuaTjzLu7LduVR9RnVDZ/BbWoeX3VKm0DC4r
 GbjRz4Mnevy7i+4OcuTEwMIAND3AFx8yhhsGzHCGdOoC7LZ7BID4zvxUclL/OxRRRjP28iUeBss
 08bhUFUwKLa1ICqjcrhJHklXBjeMNMWREyL5e12B6c4Nq3rbj2iMeLPoRI28Tr3nZSEF5SGfZBx
 LjNIT+HQWEpcMav+PFEOLjwag4NcGGDvux0oWE+FurR1Z+0tUWMc6B5tgbUwgUhMGBv2G+deu8W
 bt1MA4+u30c+Cg3tJOWnZ2o6E9hr1AVhs0mDKhmdhnNhbuG5yFokbRIhHxnRKWEbl76m3rrO1zu
 qxAu1wsNhjsjPrjHF+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_165905_528381_1F111C28 
X-CRM114-Status: GOOD (  16.83  )
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

ath12k_ahb_power_up() and ath12k_ahb_load_auth_shared_fw() call
qcom_mdt_load() for SCM-authenticated paths and then
qcom_pas_auth_and_reset() which skips the shmbridge prepare step
required before TrustZone authentication.

Replace `qcom_mdt_load()` with `devm_qcom_pas_context_alloc()` and
`qcom_mdt_pas_load()` in both call sites. In `ath12k_ahb_power_up()` the
PAS context was allocated inside the first `scm_auth_enabled` block; hoist
it to function scope so it remains visible at the authentication step in
the second `scm_auth_enabled` block, then replace
`qcom_pas_auth_and_reset()` with `qcom_pas_prepare_and_auth_reset()`.

The non-SCM-authenticated fw2 path and no-auth path retain their existing
qcom_mdt_load_no_init() calls with the persistent mem_region mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 31 +++++++++++++++++++--------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 85360365aa4b..6f0ad29a83f8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -391,6 +391,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context *ctx = NULL;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -424,14 +425,20 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		ctx = devm_qcom_pas_context_alloc(dev, pasid,
+						  rproc_info->mem_phys,
+						  rproc_info->mem_size);
+		if (IS_ERR(ctx)) {
+			ret = PTR_ERR(ctx);
+			goto err_fw;
+		}
+		ret = qcom_mdt_pas_load(ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -465,7 +472,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -994,6 +1001,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context *ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1012,14 +1020,19 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	ctx = devm_qcom_pas_context_alloc(ab->dev, pasid,
+					  rproc_info->mem_phys,
+					  rproc_info->mem_size);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = qcom_mdt_pas_load(ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0


