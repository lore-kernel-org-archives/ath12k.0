Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B79606A32F
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/vaUoLh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RxHHYLL4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4kRijsd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=m/vaUoLhs23VpK
	q+YhCh7isO3iOejpQFhITSWgBuCk5Wv7+jnwx+aAz+4ifayPZELQXMsDEEmCmoFxS79WQeUmW/Jeo
	miV5rYfEBZqMmYQ/CI2R+uAfJbEJQCFBYkpEe5yJ8BcZUjVVTyXfXy2D9sq+OJ692FhO0f+CYXBqO
	QNZZWK8lhc8DTzcX4gFKqKleZ9ZPRZcUvvhhpih17In7VG2VQBLD6SRnqOMBBW8KgSQ16+ISaO2bL
	buQWw81PfnxSt/ePcyrIm5qEfeLF/gdUMC03r8SxUv2FFLM5NkueKE3h458yCLILcoglgept48k4g
	Mk/IygBtBNDYO9WVSR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzUA-00000003CYr-1pQQ;
	Mon, 16 Nov 2026 16:23:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzUA-00000003CY5-0B8w
	for ath12k@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=RxHHYLL4JZ89clfCprwPu0V09e
	lgpy0IJpW89O4wj7L2XRMM6oGbzCyCqKHJ6PMYVBSaC7pFI/th9moaROFodZvemDLlMaic1G9yZDy
	YajgnCw6rCE+EYkeHKCnIJYEtk0OF5x278EV09cZ9Qyb57H6ntLELJNT6Pw7q7MtnhM4zPEfuAszz
	ccJ5awix7f1gUMJyDU/i2NzeHBaeDQseGQWscTgrZntKF71GJH4Eah1vS3vDsXaXUJzwJZVEoMUow
	R+4d4BZwG/gRsvj2uSSunMIPLxebTwH+7SsfDOySrhydCuu/4hWyQn1EWtjiypGZhO6xBCjdWcyGU
	K6TGIfhA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzU7-0000000E3Md-0olt
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 16:23:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIFvw3045310
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=mmVTds2r5rkgKTwEnGI5LCpN5b2
	/tLsDWF6guoPca0gYr5QEN4hCVmdEc+pATQVG1P751FBpszfBZsJ4Wybc7N//Cyq
	43ND00eDQ58lfF/yy5tgXS62HcNfy8tR1JIkrA+VHr+eEd8xANlKBfWkJcFZ5j4H
	zeGe2aop2OFMX+rcBxESBd3QXyhNOIS0pEoUptM9zXiDPChmK7gDObRqHAG8TYph
	4v9/DfUuuNaEQj3EDbVGsS9aHrWhzrkEJn2bcONk/h+wY9NimNbIfnqZK+vAT6+7
	R4/5QQkkWc8KSYkzM2upY1JO0UgXH0Hz7eOs39KTTK7pf/GC77z+GqgB9bQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m8kdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 16:23:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso5059eec.0
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846184; x=1795450984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=E4kRijsd9i9CrYq36idYHD3pJ8fUf8W2vg+flXypAHAyrKxgzRLhKSiFxQN2gEwf0W
         0CFrjia4qNdzI5z2Lqk8DGL40dkXemb8yvCkX/cvHoFz20oLka4fJVIBvQZitnHdzaZJ
         VCpG9lgLJaGoxmq/xbWNguca6QMPqBCMCcUUcl1lNhpeVXZFCABLLiq0D5Et6b43Mye8
         2juJVYdJRySOJkF//O72ehzA/QbtctUzAIhdRdwrfbC6MGG4WWBwtrBOgNx+wFvhCV5f
         QTz9Cl4qNWLdqY7ZF0iAlK2FY7fuUpC1dzzWt7lk0uJ2dP8AXXdPlL4hcLZEk8shguoH
         9t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846184; x=1795450984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=JdC/SB2DwRx+5gAniCRBNfQUr2ETsxTttldLIZZ8SLjzNk69AUk6BTST/Lbrb71bNw
         3pUXBJCaz7syW9DQOE0MxOLSM86CJJkQQ5pQYh3u1qbO4E5v1S9VvH9ji4T3i53zRzRn
         gzR0wtgTpZmpiz+ciqkzMxaSuDMEf0H8M+xFhVidkgc8bI4x+ZhIPadZESKR6XX+Kox5
         rFZvxNwI0GMQs29kQuHSQXTFvMyx97tRV5J3jNZDiNMQr5ovJLVST+VJaKlNmyq1eMa9
         xlIIrqwFl3vqKdTk/dejFE3eoulotmkgLaK0nO8GDucMs5/5P0mJgdSMaY/RRKteSJgX
         Xqdw==
X-Forwarded-Encrypted: i=1; AL+hErGR8G6SKRpIVwbKGiyRtzpkwvbC6klN7lDkD16l5L1ennfYO22hWPkA+Iwp6pE04JOOoLztUdA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+t0wRGL8Ru1jMy/CijhiZvgCMMEjHNkx7WdNyqrUAfDYf23+HQ
	nMcPwhrGYYBxopP+DtS4JFmcNu5ZGZ+JqOnoqHexhvxzliBZzG8v3+ELRCwrI99etq29lxqw07g
	aYyVENv1595ALxwj/f0YxMqGjRZS648jPdv5erpV5ts/VC+q0lNWL8yi0+Jv/VPWtEUcMe8vZ
X-Gm-Gg: AYBFou2YvoTEWffI2neIYQWu7an0G5ySumj18nh1M4mWRmx1KXIvwFLRThiJgPlUdSw
	zEyJpglxP9Mo6gYUnoJuFJoQNvkqp5+8BDC3P54W/uOecy64H2pUxoEZu05uLGNk8Ro6NMGazoz
	i2nrWQGV+50j2223RozEarSuO3ZwEg3SODFmj/aOc9dGheFjbhchIXOFk3Jjni6OLy+YwgRWxo+
	W0kIVORPQ/4/PAtsruf+nZV3vYWoDvJ/+oIDfvbBq2Rmk/yHidsQ9sK9YrwudGh7SKFW+f9+FA1
	1Gxm6TyvNk5BlUdZS6QvdFUa+YLymx8nXklao74I6ofE70A2sy5NJJRFjI+hINBHJtdwbKcsZgQ
	Ej3mYpW9DM+rxNbI2mYW2YW60TMGn4s0AJX54quvNq36+wKvYJ9bkflFjtij7XYc4ULRY+V+nIu
	ho
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11219008c88.18.1794846184120;
        Mon, 16 Nov 2026 08:23:04 -0800 (PST)
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218947c88.18.1794846183414;
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:45 +0530
Message-ID: <20261116162148.2864501-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXyMnM9O/1tkWr
 2zYjA8wW7zUSPQxZHHhBhWWr1WhkYZPUvylWdxFKyldksffoIAQTf0IDISZcAVqr01CX0SjEE3K
 L2Hot7flAMCLALGs4OgC2z3jE54ntwtZLl2qqDSFhTvs98wph2QCUD+HMHTvmPNWEf8DwAVVTek
 KLWbLxJlbvVTyjCe7xkv3QbHTXVg6UZGbj0QdatDr9+JVUN9pNuYtJnRaan4P49MEdDceLawjFM
 0AINgch7H808k8K45mT1lyyyZ/0k5rvhUO/5kBl1Kb0yCQTih4E2HrdBSxgaROiJl4JhWkpgeNv
 USqKJTaEf+Z7Pql/h766mixaXid9E3ZZ/x2KzwX2JST3Vt83SgoBGRAVcQ4hbErCdmSut1Yjh3r
 DZwnPEBBb5ELZ/NYy0bJ/ow7VTBmJ2YwY83FYQVHY2J0fNhzXkbKpvvC7PMR5xmt8araugfgUSG
 T/jgDLlwJ3MBkr3fncQ==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb2de9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: 0C6Qx9_X7OFC7IAs_ngN8ARjGKQ5TUGc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX25vFnx3y5bYi
 jPOsV8cCMocdgSeS7U18RxtTwszVBVvTgvh9UTL3aGyIfKXizb0fN5V/SwHk0giS/LpTaeRnPbo
 EG5l45hKXn9hwd+2y4wZTYv5765Y7Zo=
X-Proofpoint-GUID: 0C6Qx9_X7OFC7IAs_ngN8ARjGKQ5TUGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_162311_544548_7B130321 
X-CRM114-Status: GOOD (  18.31  )
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

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0


