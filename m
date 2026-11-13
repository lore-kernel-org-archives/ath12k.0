Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3995460A5BC6
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UsKgFKzK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Brp4LETH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=UsKgFKzK5i+9Il
	doa+sEP2ywIA+lOU/t+IPeIbmvDYU53B6RaUMB+p67SgbnnFPneTIc6bJgJ6Z6MtpDiSMX3cfp7jh
	1IX+GP1jJnZxM3gmU9vadoyCIobT30FGtkfE5vwCRsjIkOWG+kvcEySwOhZqNss1EAELe5NDbB5BL
	YDMky3m7/Fq8yrTyq7JSeIiiiorL5aINVNecLvs4Hq+hv1j1SjqYe0WdrsHaxjz952R+Ayz74fjp5
	kMriAXTBN0EGVFHk80qXqvn8XyfqF2FihRuipTrSv5VCr289XEUlfbrdlu+zqCDQtfyNLMXAyxgdA
	Oth3q8z06G5m/lXfI7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPf-0000000E1Um-42UU;
	Fri, 13 Nov 2026 18:54:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPd-0000000E1R5-2NpH
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5sm551868
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=cQLzIrhSoij3Q3A92ujCBOk6ye4
	qmX/+gDp3wbXyaXnThiusMCKD3rVDNtY+4fr8xgyTpKSDW80LvkXAURGHSV25zed
	40dcT1HGZG+naWL+HVAdRSr3QovZKOb+WzNFyd2IfkBdjqdlD1S2oUQpM2GFU6tf
	jOwA4cYLo6OHq0gKz31H3gF5giQ7IhWrVmt2+S7bYLniTn4JqG9BqLikIlUn+RTo
	r8B9Rv85nFDqt9h7zPqSc9FpscA9TNPYOv6GFVawa5StM/DnjRgjX1GykyPffIG/
	fh/LWgFda52/cqPgn++nPXffKiObpwfDeLL+OI8dz51iCIz3A1OFQlHn4hA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:54:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so932186eec.0
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596051; x=1795200851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=Brp4LETHR9YX1r6Z0G38TsAMl1fG39hHmxV0WLSsZGnr3pw4hKgWeqTsBiR/pj9eDi
         GgihgJf6nO7AzGx2TDJWuMoYIgIRQeF51VfN/g0EshQt+0hcRddm2Qwu/iiy13iY2wg1
         /FdOZeO++qY+g3828P7MWPUumyaawyGymb64qgAKSFrJ19Jrz02Op9CLVDR2b9IeW7xQ
         pxgaNDRlJsRM8gePrhfA4GVds9Nq0FBBDSPjrYzK9e5OUcSnVKXIBVG6dPa8EGFD0hxL
         n8U/cPuSecVvYwoIx5b/XWBYFl58k0ygKxgX6wwEeeQgl9rtkkSomjLC1BQ1tvvrYZjr
         b8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596051; x=1795200851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=0eDz8DRHYgCENCCSu+WBbU0uoGc19Yrj8HonEC71AhVQPWMXexnTHhWt54xrvOBnFW
         1nUJcs/AuaTHUEh/IFMgdMTLkYJueWMgjG+U7sItVCNb8wnGne+C+tzz/8zG3ZaL8BpC
         Y4ZvYpNXMHcsrx+tnhNzzIENyB2RSXDESj2otZT9/V/NurVPqLKTjh4bwqWxXMrrDnbk
         G/TFEN2IP+PlnkOHE/VO5yjclpY+AMrdMfFpn/roAlVm/bsU7jZ3GYmWo+Yy3OHRDmr2
         IKjhoLc7z5vugA3YfGEbbe2Io5FV9Y9t9X0a1Q0uuKFGCmsmu12seLoqvYt/sY8JTeP+
         pn0Q==
X-Forwarded-Encrypted: i=1; AL+hErFAGdA1mlZqc+hN0O80dQWamk0UprXdqqOmbFdwlyuqRzX1Ny/ZGJ2nlI+j36ih7J9GPpyK87w=@lists.infradead.org
X-Gm-Message-State: APuU4Z8j7VvnaDCnlqPOwls8Nfptrf4jQM5YSWsXfC3WtViT+lqteCof
	+IyhahFLAiXHwLZQKQ+3dq64FQRxQgyPeBi7D1tlUq/OjWlU33XE1PmOyOz+2WHKjCT3PK9rlD6
	VBpRwnKxYGbINj67KHPy9RxiCuDxBBYrQ+RGWNU9edTrs7amXiw0kY+8X5kQPOh8y
X-Gm-Gg: AYBFou2R+orXlDKfk5lje0sIt6EO12ulRQHYp2+52Yn3VlzIJ8DSSAH/x+ADCqIznbn
	xvqoP0glZGFf0OlAodpC/Sh9N7VZIeKTS78r/cUxqbVHl515j7WQSlPryBTBpW/HVq6lnMp5CYC
	1ENYx5gs8BuPdHU6l4KTUnRwjxfGqtLKhSZgkQCQoLjjVpNxGrH3H/zuaxnEcbkYve7OKWGEp6d
	m0TxODr92yU94G96m+d5SjZ+GYWPVVQPcIG/+ZEoajjUokAXK5vJ+R3O+z+SwdkSS00hfT7Ay3y
	ejFqFEHIH3XPl3KeA8hFXYlVrmG0WuzA1bdUCSPlt0ya3tT4k9zM/vLnGYM4IJ0pyG20/dNl2yN
	R6XBnV19FKcitgW7FMiXvUEH1hT2160EpntRVvj4yGt3Ca9WcifvE34dS9DtPgQ3+5O3wa+kyhH
	8=
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885925eec.13.1794596051380;
        Fri, 13 Nov 2026 10:54:11 -0800 (PST)
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885896eec.13.1794596050515;
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
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
Subject: [PATCH v2 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:06 +0530
Message-ID: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cd4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: O_C015hCiSHV0O7PooigpXZ37KF1wzde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0ppMsGGwcWIk
 VpbLb/0aPqa0NgHamPPX3fm6HrJ0+zNF1sihHak+cvQ3sYZNHdaSMtKHF0AK+eJ43vQj1n2fQXo
 mFUopfuBmFWtTyG1uGWEEiLGYgBkgQE4PBh3bUJWdVBKeN553n+V2E3f5ZB0EsI9u/XFUPiBOUk
 Yy7yzfsg1ecA2uXStjRIo8Rb4tD2zZix7kCmReaE1z0Zzzxc5Of+3eysEQ4KqvmInnzrAaBGwEr
 Wy279hz7sKqGAVE4ca5u/zAlm0URof71eP9Wptz4CJ5qnSU7mjdvQ1G3VTqxk3q6E6o9hNBgghm
 uZWwIS7tVCThsSrwEPuHvvhpwCneW2AwtvNvmPQR1zp+X93D7zfOJknNVENxgcyAwF5MYxYrJRC
 SEsu4e/mG8zVmRmYqHkdpuRrGlJ9NrjbkobAVd4+YXRBPisUfidfCUxBsQ9wlqN8z1LJ1LgI/wB
 d/KRtsb0v5sQL6b3q2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX8sjivrYc7Dal
 D3eUXMQ5shIIRw3Veulbjb6VXn9k4SdHuBfeIGreNROBLkCN3gxr22zo+NuMYd29U0xbp0g6A+/
 ZVceeiP8plUyDR3b5gaWHJya5yklOj4=
X-Proofpoint-GUID: O_C015hCiSHV0O7PooigpXZ37KF1wzde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105413_725543_FBB70D93 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -2.8 (--)
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


