Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F16EC61DB6
	for <ath12k@archiver.kernel.org>; Tue, 25 Aug 2026 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hv9r+64K3KZer1HaUJU7uPLWJOybOoMeHi6liK+PZew=; b=dgbu0u/ko4iVZ6/xzyV9RgUdbm
	vUYIskuAjBOxhn1NY6YXGjDoq+dG0V/4CXxytZ3CFSDIdtkIeEBC4dxcImcdVdtjjIzJvChIN358t
	9GDfPJ35Zu/BrhUaQewyOwPR8dFBC579BNRePX+caC+xlXIgfeSJWB5+ergryIUchS6v/hK4KDbBd
	Sg3xf7NHbdwP6Z/6eQYNHTIOQ/1LkFLbWTKFTxfphYkF231AJmo56cvbfgESwl3CMmMPInZ5ODrCB
	QBWe68HKxOUCwoeou4qBtJyjrbuenkABSBmL36al1BGbBr4jQaf6sCVgsW6DJ7x3CD4TqVfUQ1cLw
	fjJl2Wyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymHe-00000000Lks-32un;
	Tue, 25 Aug 2026 08:13:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymHc-00000000LkC-1px1
	for ath12k@lists.infradead.org;
	Tue, 25 Aug 2026 08:13:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P895t1878114
	for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 08:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hv9r+64K3KZer1HaUJU7uPLWJOybOoMeHi6
	liK+PZew=; b=mPyjSrU7iaatxis04yo5xMJkEkXPAJr+nnE5OHTt8BYiDLc1cZR
	EOSgU/rOYvIeKSZRChpG/pvhq12tZ91VmeTqt/MxIm/blYeAIXBeb+AxL+P48sFH
	aoUwKwMWNLh4N2e/L74VXobdgEFb0B5PSsjoAOZnLMLptIjYRXAZipbgtvarTkKc
	uk5WxTYMAq0YSkcp1JUXnUCdWfav1XC6jfIw09eIaeVQ683rfKAQ7b3E9D+ZADF4
	uG/XAPwegx3i+MMndXMa7XyTvRTxsbyTmS5nBDGoxPMqkIi8aZFclObGkckmpJvn
	gXuFucvE7yM4ersiW17v/NaenmPNdSpJXqQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8rqukafa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 08:13:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so32680276d6.3
        for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787645602; x=1788250402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hv9r+64K3KZer1HaUJU7uPLWJOybOoMeHi6liK+PZew=;
        b=DcPYbYVUG61USxYFmkd/21x9FGAAqGySikuHUyBaZtKNCH8BIxSSy4mMx0jl9lIvLb
         Va3zhHmz7yak2V6lUdeU9TGLtu+ncZfsAC/Top4QuiCkQawFQgpdeh2wDzv777Cb16VS
         owqQZrMaMHgsCzSCACmSnUrrPUxm20fHVCsIe9vVFqDDbkPhhuGt3mSqODji0UQTZkKl
         MxoEBwCS0vyN5qLRHBqh/mcRKAL+wEqDLvX0gJzGm93D0rtkPIBCuT7ofN+FokeGR//m
         CSD3Vz+WJ/+Zv8SHTEKXGtv8ItBCLJyo/ckXCAbYTWp/hZ8a5/FC0o9y9Wcvl3Re71dA
         bK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787645602; x=1788250402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hv9r+64K3KZer1HaUJU7uPLWJOybOoMeHi6liK+PZew=;
        b=ZHPmGf18hi6ZTjf7v0Sn2Qad0iAWdg0yAA7KHLZ8LfVHmmnyNyEcr6DS2wa8WU6YIB
         QCfhS5c4eS3GpkZVT53kMexALMhLhUoK62FbOr20JjsxOyEbm5kfunpno3Ov0ceJu0HH
         TsDFEnjzfUlBI5/lv/czFsItI9gRZDZqU6kT4TSIp2J5COWCp2bnzBmW0yJLh7zL1JXZ
         Ubb6WAiLJGekZ3HtspppOK/UPP/+/je71h+J0WGbG6xPvX8WwS8nBMlzp/HIUa5QseZu
         RjSYSdPhYsGH/hey9BX+Nt8K7mUX6UrZeQgoqJqMDslPqGoloyb4C2Nt7DNQn9XCsPLi
         pJGw==
X-Forwarded-Encrypted: i=1; AHgh+RoCnv9D+5u/V8ou1/iJcal2ruBjgzcliIinJGeoNHb0VvNNZ+xTCpHK9uWuxXAV4Mw1ctG/mQ8=@lists.infradead.org
X-Gm-Message-State: AFuF++ke70G2IejGM06WzZLR1KkV0NgUN787huQjXK8h55ZW7ktO031g
	mxc9CQdVCNtiC16DV44v+bYcUoJLELzSTCFgtjrNUdXcccOtDQVj+upqG6/AbUfnNf0UAf9jD89
	bYalkDMbekVZLFygE8+YS4/voQIbaEfVZ2uUL/vJacwt4l6vP1gT+CXVu49U7QxWc
X-Gm-Gg: AR+sD112ZxI0XVwm6u8FrsosUehLI7uK1s4YrSSP4c0AI9wBh/651GrzALgh6jrzdlu
	czvSZzhXbE0N6CfjSjSqPuSoiZL5tKtB9PoHmO+eZa9dLzccTyBy+jBc/AfO/zA882P1ZK/Sy0h
	rOMl+MBoZIv3Zd9dyxyjeGezEsz/XHVpoMF4+Ey3c5MhxUr2HxJgfng/3oRyias+TPkBYK2MiwH
	YDt89UOblWW+WlGhyuHjQ3OorOU2yZ7QA+fvXc83D49MYQPvHufU2PS/MEmCD4C6GuNlTPnnpt3
	WwV8D6Gx0H+TlVW2yx8tENGnyK7lCYOGqpA1jUtaj8LlFzFMwJd91XYuekhys5pNMaAqHVXowdN
	ZM9GOvRoZxyOjO7o=
X-Received: by 2002:ac8:5f53:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52df59ec0d3mr344910581cf.25.1787645601990;
        Tue, 25 Aug 2026 01:13:21 -0700 (PDT)
X-Received: by 2002:ac8:5f53:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52df59ec0d3mr344910221cf.25.1787645601382;
        Tue, 25 Aug 2026 01:13:21 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1687582866b.42.2026.08.25.01.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:13:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] wifi: ath12k: ahb: Revert undocumented ABI and dead code
Date: Tue, 25 Aug 2026 10:13:14 +0200
Message-ID: <20260825081313.71351-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3254; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QQ4Mp+MQrZ0abZOXlL4Gh1EJOdpfUwc8kPhdt3VDwl0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjU6ZmH29I4c1VwrnjgwykypA4ZmZkqL3qWwfl
 reZhLKS73GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao1OmQAKCRDBN2bmhouD
 1ziiD/45tKK4t4NoPjGQYgAtqj4adc82l82kkAMngH2NL7E/kDcnYCxrDWaafpAzJTp02bwCsWA
 7u9eaizT6xEKeG+y9bDo3lr/YvEaVSJ7bDH1Qzx8aaMWPl8GNM6xb4NqpPrca3L5fUHawOVjtCt
 Iy0wMTsx0NfUeCWmLOyRooSf+zTlFAFlFl6IvApkQeOwrFohCdGKaZ+cV9VPSL5Gu9LOZLqZi0H
 4U8L44j68gY6jyybO+RXaSLTy4qg1nBrFCs1AAl1/1CASnZZ2rIIkt7rNz1NxYaXnGC14SvcbHU
 zAsvVkDCDN00KuZNVc1Yaq1qs23PHelxcOm9/XakIklZMtkMM7y+9gty9GXXChBAwtWrul56jQR
 Nskx1sxSFoMPAn8fk0t1yle1h7751f5nKKIzmb28nsF7W3yumsOfGwHyoZwSYVT0H8x79lKj+yb
 wEKm8XhbjWjyEWazPIgTZuseVmVwrFiJRAuIvAhMDTM92ggo+8JV9OLBp3WGHqCpLcCqKBuZJVb
 K0Dw/xkYdlX0ruTO/DIGLslbmUju5FnOvtXSmNPaP+SvNM3WtE6TlGRl4buc+Ff0w+UYw0++3R7
 s+3W9CYaGpzlBvYDQwm7inXm15q49zNKvxrkxsOxKIIKdwHHEIEmIe2pUoe8AG5PdM0xAFRzQmW KQlKrpcbHCxZrug==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D9W-HVUL7fJZooxaN-yMwDv-QINo6HKs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2OCBTYWx0ZWRfX3SYIyZBCVgwA
 uc1cXGkaXFNztxKWBmq7XGATz4acI9CdMPpCVHvOoSkGiNMvLjTnv2LG+Hft+ta4sn7ZJFtCxUe
 fL4m1y5qPIEwXBjWyANbpf5zRoSwxSg=
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a8d4ea3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Rjp3qrauO7Pr9jUhhQUA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: D9W-HVUL7fJZooxaN-yMwDv-QINo6HKs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2OCBTYWx0ZWRfX+O1qLQyk/Suw
 xJF/4DEj8Tp7kh+ociQGdannWi1hwapLM6gQTYp1jDKXKtuSr5kqc3BsaxV9hF9nCN8JOSsJsMT
 NPXQ/03SBvVLtO87EL34/91z2Kv2N+bu2P8krLLZAnbVnF03SfxmzQBRn+assVKmLu4m7Vnon7s
 RHcKuwTz6ydrgBbQ9szY1yM17conogM4KCgLu3/Zw7hMOO+S42JcETaqwGNrGDRvz02VByDSpaG
 v9F9V2JQNn6AVNFuPYhTVX6kxP9gNu/htnQxLrcCirA2k52FTSMzEfMb6PC4yarJPe8qEThq2LM
 KqVVU/93fEQZXOc+y6S3J5ijyyHMWz12igLPu4pBkNpQqnpZ8U53dVFwYowW4IP1H+Lb0TFXlS9
 c4yVqiorIEh7CkuxTvEohXdJMmFlPXLXxd0HiH/1mEKxWzDDd301z+zpLoPv3MOIuCqQLArVq6W
 SRnFBJx+skM0vW5pjxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_011324_492371_33090B0C 
X-CRM114-Status: GOOD (  20.84  )
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

Commit 96f46607bbce ("wifi: ath12k: add AHB platform descriptor
support") added undocumented OF ABI, by relying on a very specific node
name.  This is not allowed and was never acked by Devicetree
maintainers.

Additionally that part of code is not even used, because all devices
have exactly the same user pd, so this was added "for future".  Adding
dead code just "for future" is heavily discouareged in kernel coding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 51 +--------------------
 1 file changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 98a6606ffd76..6e9e9034cba1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -15,21 +15,6 @@
 #include "dp.h"
 #include "core.h"
 
-/*
- * Node name to UserPD ID mapping
- *
- * The io_start field is used for additional validation when the reg
- * property is present in the device tree. If io_start is 0, only
- * node_name matching is performed.
- *
- * For platforms where not all WiFi nodes have a 'reg' property, set
- * io_start to 0 for those entries. The driver will match purely by
- * node name in such cases.
- */
-static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
-	{ .io_start = 0x0c000000, .node_name = "wifi", .upd_id = ATH12K_AHB_USERPD_ID_0 },
-};
-
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
@@ -55,40 +40,6 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
-/*
- * ath12k_wifi7_ahb_get_userpd_id - Resolve UserPD ID from DT properties
- * @ab: ath12k base structure
- *
- * Returns: UserPD ID (1-based) on success, 0 on failure
- *
- * Resolution logic:
- * 1. If reg property exist in DT, get userpd_id from io_start
- * 2. If reg property is absent, get userpd_id from DT node name
- * 3. Return 0 if no match found (probe will fail)
- */
-static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
-{
-	const struct ath12k_ahb_userpd_map *map;
-	struct resource *res;
-	size_t i;
-
-	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
-
-	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
-		map = &ath12k_wifi7_ahb_userpd_map[i];
-
-		if (res) {
-			if (map->io_start && map->io_start == res->start)
-				return map->upd_id;
-		} else if (map->node_name &&
-			   of_node_name_eq(ab->dev->of_node, map->node_name)) {
-			return map->upd_id;
-		}
-	}
-
-	return 0;
-}
-
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
 	const struct ath12k_ahb_desc *desc;
@@ -106,7 +57,7 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
-	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
+	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;
 
-- 
2.53.0


