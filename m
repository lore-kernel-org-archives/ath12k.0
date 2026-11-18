Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED211606A333
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JemasWsE;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TG2gVvh6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=JemasWsEiwc06k
	BfrxrXEU+h7nxj93+LoGMNF23Ah0nnd5a/Dwh4qvaguAlzqTIWOq+TDOaSRUztDbzAggR+bUpAM02
	qx+k5LcADCKn8MSIwbvR20M4cfxYsQE9SU0zxXlszWe4P68JZTX7jkpJJzj44Ky0cvA/mPBm37qLh
	d8mw+imjqVo9KA3G3O34Xum3nCBTJUWtmY59zuZm6IIUjbZ+DPEO4baJL9cnJ5QREbsXfw/R6SRyS
	JOBirSXttdXjLH8q4zvmVNlVCVNh2IrMWe+PUqUtN4br+A3wx0m03qEDod4+snsWZDboGTU1AHkMi
	VsToaO4XV5j8LGUcKbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ0s-00000007r6U-2sHZ;
	Wed, 18 Nov 2026 06:19:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ0o-00000007r3c-0wWL
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:19:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvGG4059960
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Do76T8LSF05wtpgg
	Gt11GH2PLpKktrmfYjxLGxCINJ6jNabvTRQH4fUDsv/Y5iDCSpGE75bwfFRdSXJo
	MZTfJiGGZMTSqPN6brfN4ZjUmDCZ+CVjy2KiZt3mTGPfXXBbgiJ4HAcIFATRsUk2
	0WvG2jIKmvkb/7Nw2fGqTnSXki6AEhw+4BVSLgrcoUDYi0FUZGAWqlx7mR1qNWlz
	myG4kbx0wmJ/pmExKb65ugjL5zipXiCjfEnZQoPz0urufdOfPk8QBzurCLQaIs2N
	NWrqQfa+s+ZRCA7+HNmnYzJNkEAGpvtyRmk8P40r1NGKFn1C/uLsCLkFo4rbEaml
	O2hNaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchj44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so738797a91.0
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982756; x=1795587556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=TG2gVvh6F3UWUzniS6q/pZRfakEJwffthA65zf/o228EiBgPkwVlHcxowy31W+WvG1
         P8CCkX3Ga+z4u1n0lrrU3J+poCA0mKVqeuIll+aosSFug9OdOax086E8ty2f1iOi1Fxz
         TGjr/PhwdPfxrgmD/XRI2NrOpDnTlv/QHuPy/4zsezHCaVXJVAaYBDZRgpCKrHp2iYa7
         iSdEjsWlV5uLO/zGX3Ebyz/U2THBTob5Nz8opTTS1c0KzbHk/S48TkO/I6jqR/5pEGD8
         SGcmxYRRClAZTOrau8A1/X8YJGMUFbl15i7u+UM5z1f/QpQBhZZXuN+mzf66DsZNKQGg
         94NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982756; x=1795587556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=T5QvnVUTUUCktpGjZ6dmfUbJ7DHbJy5NTTxVcvVlTw55sCjBJfN2UcWattMbTSHjSp
         JE7N/nLkXZ60gTV3qBUMhruB9ssHq7ytHJ/DIRQ03XoY9F8+GeI+6IelGMwHr9Rico/E
         XbRjvtoL+IvjRtvQSrjgZgbSrjqy2+K132YVQEab1mCMTRKRyJ1QtczJuFViFY1y4qE8
         UL+1Z1CkubIaiG4dpsv/UmJ667q88ZeEq4nQ0ljstwREYsp3YwTEo/iuUkj73IoXnVwH
         sBFNul3DKac5ka2jv/sOQ19OX1asW2h4lNjPDTXwuwCkxEJYqjO/nHEmMRaO1HZGgmHl
         7QWA==
X-Forwarded-Encrypted: i=1; AL+hErGpeA4dJgVF4pbu+mNgL3LRDU0q8b79MP0+kDFb9u7aes594ZKdAJV7qxph9J5PvlMLq1EeWhg=@lists.infradead.org
X-Gm-Message-State: APuU4Z8w0VfdTYIShyc09KM1FepNONEb9JrRSNbSxoahXosAka+0hckq
	EmgbjB+1PpT1ATel041Wg/7JHKnGYvolIgFx13Ev4Yxemg/pLV1WFyeiAi4/XYfw8SiAPpArPz/
	R/kyaWA5VOiE6nKTZM+HdozZZ+Oq47vEzRxykBDKS+nf13UWOCpv4dNwg2NDGd1js
X-Gm-Gg: AZFdTZc/g5L1ZY/tuwrRGreuKWXwPUh0XsBb2qG7xo39/fbxi1FjYIsSvE34K0JyS5w
	PtotlYj+j06vFTpc/y33zH00gx6ELIedD4bUoNMjN+1bZ6b1ZK4mX6nCXDPmKfarYHFfz1xxikb
	ACoH92d1DkhP5xgLGRB7LHgOcHxAzatcoaMvfUqaCVmsAZ97uVUBsncacK+Vvr2+BqPtufsW90b
	5LdXex9SffQDS82IMNNpsZ91ef0hE6w2XAb3rVI5LNI0WnPBp3f/YZHbx7B3Ml9ZObHUfCIYDow
	POhlGXhRBlrFzriqL9+dvu189NnXw7neXUrCmVO4IqTnmHH8Jy2/irQvKRn/s/73sbebwHCMBT1
	JZMKV8w+R937gvyfc6gAjMa+PGrsnv13Fkvut6mwPUdWs6WjshKFvVxebiAPVYg0dF9rtm9zvkn
	M7xnWXTPzTIxNQYLh6VtASiqNaNjSc0Jf0vqpoznMIWu7VCUbrKJgZGal/8hAEMbnicRfK2B+uc
	8A=
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569836a91.21.1794982756194;
        Tue, 17 Nov 2026 22:19:16 -0800 (PST)
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569814a91.21.1794982755695;
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:04 +0530
Subject: [PATCH ath-next v2 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-1-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd4365 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 8H5dmu-1HpUDuvnvWP0mFgnGbfkGB2K8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX42aF2vHU5UlA
 JrCdm3xT4xCGZghn3iDTsnFBgHJdYmjd1gNPukltrNdBanumws1ItlZmTUXYpQYcfZYjW+DlUl1
 hnj0ZrRZGV2oxSZpr31w9DPxZZxKCL4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxE1EWsr7GIC4
 CJbjt9AY/dWWJaBybYD6WuW5/YqjMUTHkt/23GgSnP3Hq8yGl6NTa34uwSQ75LLZ7/5hJVf7aAW
 XMxQmZhBoKMhZxDkf1wk4KVuUnXqmwNWhnlcNLI96jMxv2V7PZ5XoHHCzKzOzdM01tSMr3XLDty
 CVc++bjBH3ZK5Gxkc15OjVHUuezSO8ak12ypYuGtohxOEpTksTLMjG8aLxhCVjpoc4b1p7+UMej
 yicCRqORzA+6E0/LoGmSLkRbRqczv6bd3+FQL4HMM3GPlgmtgpDHgQ3pFd4+Yksv9i9ID603Y6/
 p1dUorPFIDYnRBM5O6JTIUKAwdMknDMN5SSnEtULY9t7ICAnb94MfbJ8Lc8MLXTKKlxpJbkAq7x
 giS4bF5ZUXfTUk9Qjw2eyaTGLSfuyFvVKqp9TTad33kufh2sby6ypeNX6HMyZW64Pjtn8k8D/zw
 S72tmf3hFuR3KSsYvEw==
X-Proofpoint-ORIG-GUID: 8H5dmu-1HpUDuvnvWP0mFgnGbfkGB2K8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_221918_425746_21D44F5A 
X-CRM114-Status: GOOD (  12.72  )
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

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1


