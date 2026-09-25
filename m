Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264A5C98325
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=; b=nPeXKp7njwE5xeYdK0Emw9JDpM
	ojZgU8VvWieabF2wXmRNvEBzJ6DFqiRBmxQFLPKA7XTDdMRSlMKASBi0zcGnKERo7Ku+CiGHjwvJs
	fT/RTnS/MYOl3g3wXNnHoH83JrQh4K3IjzX+NDmoK5GR04E8Vd4C5LM0HmDUaA5k/DKCJTbWQWC3N
	drASdm/kXRmpk7xr4zmSlQl2/4mUOi+1CX98g0Mx8JAk19n9WUcqY3FGPI0BpBF23akkGa5qHW8Fb
	U1vCw4aninOBc4FD3ucSPtCsPQLFK1auYSZLlZdSyz4on43+g/itkhTGXrpRZTKj4LSzU/WJGNtls
	AM/X580w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8KW-0000000Dsxv-3Rf8;
	Fri, 25 Sep 2026 15:59:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8KU-0000000Dswi-3nLy
	for ath12k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=; b=NZI4zrB4wxXcRJAyeGH0PXhwVw
	soEwjYhjPK5Nw10LZ+R1Bqm/u5VoxDL7P/PY/cnSUuffgihxD5vncvMZKcWWBNvlQ9emPYEZQUy2N
	sRCoZjr0TcjWz7IgQn/Zz974eKcaOQJfgIwgbfOATcFzWm7gDljcmZ3G90hvYpAUOO3wC39CzpLN1
	1P44sFHWkQTBEbve7Zydae7nRMJxGjyUVpLwfqrIJlPciIMgBujVvr1u2FMODNBmbzbF38AQj69va
	jV4vLVOKKyETjHlVEEuwGcXBV/Fq+Cyq2LjEB1kVXTK0i8FjjzaPQh9R0Fm8XvEC5sf5nV6lBGitL
	bD+1z4sQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA8KR-0000000H6N4-39be
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:59:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE1SoZ756780
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i3tD8eNypyv
	tY1j258u6wRodTx6BDbTX1sIc4pY1tDU=; b=CNeisGAdoyvIOSATXZdYhJKtatb
	kX0BKeNK74VUYi1svbbWgIjtQSK2zhIdhrtxgZLmTy25fiQo3r5t9UkyVc8tpdew
	+7px2QosmNDjruUtBU6VIsGHQv9yQLDSWacEKOhax4eVT9J3UQ2WXuqvdw5B/pXl
	+i5HvQ+WQQ3fXMYACHsLIeqOA031S7DOGySn1zKl8pe5gKftvPbKHXlKXazTFQBP
	WTkYcqKVCT+Im6X1UodRM8D0MlFaPtuodGZcrBX08JkqT1lsfdQYQu34TvRpjtcV
	MJjfczCgiJ+f3YFwJAbt7cu8RPP1KOJRDh7Mi4yP4LXcUscPb56syZm+DDw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq0a3qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:59:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-880e099bba5so331543b3a.1
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351953; x=1790956753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=;
        b=fI3bSCDQ0SUyXUMZPoKdtZ9wHg8Z/fUT6quylCPiioroM1zjAhyGIsiGkocvcfKBQ6
         YhHDGquOQoXHAZTNiV2Iu+A9XaSSPRomapE6bNIS+P1AVhCOHfGoRxq2EUqc1bXjurEu
         mtwslRkTroHIjOfzxxWAgXq7wZAB+tWcTm6pc0BSt1GRusE1mFdlCM7SfZTpC6JnVYGw
         vFp5hcenTD0ai56PQ7zCdbZGnUwCy6EC0Jz4XDC8ZEIyVvWjgvUcN3yAgxR6YIL24Hw2
         bj72QR8BG1eDXqRda0GHgfisHafDhxo/DxdaH+oGkF54zuKEmOVMgO+5SXuZSyLw6c/h
         itYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351953; x=1790956753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3tD8eNypyvtY1j258u6wRodTx6BDbTX1sIc4pY1tDU=;
        b=zFhYARBJCUUmzhiQ9D0C7QaDYAbUK2Ip1xWD1jabe8KlsX+IGxY0LHzBUYd1YO+y/z
         jZEmLqlFf/RDF2FIJx4lVBD8AK58EH1ZJFlyBmqAlumfptF9dAhEgX6jiv6FBiXupe74
         tQLskgE6SomrMfR/30oEA9MSpL2IADY7OPiItN6kZpDz0vySej/bY+CZZP98WjU6beUX
         MzmQAn0Yh2kyZa/GDJqJ69jPPE+NqjTQyK5G3GFqcSZHim05t74b/Hu+dwYDaQU2uNiy
         C/nWUzbTHaMWqSiyz5VIgpheYtMRHeOh7Akq+AbyScWH6HoXir+4iE6jacMctXclcoBA
         uHBw==
X-Forwarded-Encrypted: i=1; AKwUvByyivJprb6EGrHFo+5aBlBB8EnenHsQovYNDSJRR9NtNOYbbBa337RRUcRGV5ntPOKL3lKQu6U=@lists.infradead.org
X-Gm-Message-State: AFuF++kO8EKhWBOw0MSYOHW9xi8bvnBd0b5Tr71yn3ZVIUr/vQhtKYWW
	QPccmRJKZZwDOOg+WafVRX6FtVKNKUJvTFsecvUprwX4mKOvQpluksnFUs2dpe/d1B3zP2vqwA3
	ZhPGVvMk7bx4D2MTTGh1xxMGoVgNik3auCy3aoBExITndcxGo3ABD2gE4NBULEMhR
X-Gm-Gg: AYBFou0BkzphwQGluFNa2bX3fJa5863larCC5z2bsfgqaFcDdKxumVUk0gZelPkntaV
	OsmtxwvlmPGqZZpuJUY9TRYUAdCf3TBL7+6oCffpLXP02nd4DNQEd1gtyVjbXY+8zpr0aHpn/gs
	vNxwW47CgkRA4E7UpaHs0tCbjZKTKf5uw211YuZavnC+S/8/s7rv0bz+JLiNUvnXJS8uZuAOxSn
	Ff/5U/elc295c6En1OTZEVx1TlJEGKHWxKI9075GnJwTi/FjGOoFIE1xukf1Ip4MsI6NJS5jTMW
	D3CvBLRThBrBCda4E7caCAAiJbNWgI4G0eJSdMnfFgBIvmOnC8BRsxK8KR6yCSd76SO5v05BUzk
	sVdQUNduJwt2YnY2zNQsgl6gnm4o=
X-Received: by 2002:a05:6a00:44cb:b0:857:7337:5db4 with SMTP id d2e1a72fcca58-8802a0bd308mr1996701b3a.18.1790351952558;
        Fri, 25 Sep 2026 08:59:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:44cb:b0:857:7337:5db4 with SMTP id d2e1a72fcca58-8802a0bd308mr1996641b3a.18.1790351951930;
        Fri, 25 Sep 2026 08:59:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:10 -0700 (PDT)
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
Subject: [PATCH 7/8] soc: qcom: mdt_loader: remove qcom_mdt_load()
Date: Fri, 25 Sep 2026 21:27:36 +0530
Message-ID: <20260925155737.4161358-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX24TtXY+OLwR+
 qr8NLgVt1t0cxVwBqf1MBqIbA/adJcvwL4oSl5uTKVB4MH/geyAuV4436XZhTz1WwKaf/3RO4Es
 dQ2Pu46AGM26oo6pEZdtp+hRlx53Hh4=
X-Proofpoint-GUID: 8iYLdMtYged8CdNLCkaG5oJ4-AP3HZFi
X-Proofpoint-ORIG-GUID: 8iYLdMtYged8CdNLCkaG5oJ4-AP3HZFi
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab69a51 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZW49mn9jNiMhmSsDLfIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXyUKyMHh9fx3H
 RjyBLZOd0AUCt7C+6xiLHhQzd0lmUiIFsj6D8bzNCKz7M/cIx5BeOhaXzOjAf6bf1JimIkBXZbK
 M6Dqd/FlSVBf79bU+hD/efXv9A2yvnhXSG4LtNF1KFqHOx2/9i4Ss0mimF2a05mwCyNdaAts8GI
 +KIGYffPu1FSendwcAbFvQQAwAfr2COyYo40nU6m790+2JkDzaaGjJVNnXA5+YZAMxssDByyDxD
 vonok3l5C495Yys3z9nvTjkymN17y1u2W5yw5ULeKy/kC32zeAQ8pEmexYuGtj6sywJBdZ+Zabd
 OtRHjU8A+sjSCLdyDO0Uz9IjKGL1OvaYNwWsPZxolKm6WeOXDlsjWC4uGAkMTDV7ZCuodmsfjrS
 /25fdB6TGC3afj7djafcJ3QDrslxgvWFOxbwBYZn2nDOQYdsbhTdjkwrq+2gNFY64qj8B0Tr8lC
 DYEPXae3Eg2jpEQj1JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_165916_247924_CB673ABD 
X-CRM114-Status: GOOD (  18.25  )
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

All callers have been migrated to qcom_mdt_pas_load(), which takes an
explicit qcom_pas_context instead of a raw pas_id and delegates memory
setup to the context.  Remove the now-unused qcom_mdt_load() wrapper
along with its EXPORT_SYMBOL_GPL and header declaration.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 59 ++++++++++-------------------
 include/linux/soc/qcom/mdt_loader.h | 12 ------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 002100fe2d32..1c7b5906f6ae 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -326,7 +326,8 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw)
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
- * @mem_region:	allocated memory region to load firmware into
+ * @mem_region:	virtual address of the memory region to load firmware into,
+ *		or NULL to have the region mapped internally with ioremap_wc()
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
  * @reloc_base:	adjusted physical address after relocation
@@ -341,6 +342,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	void __iomem *mapped = NULL;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	ssize_t offset;
@@ -350,12 +352,22 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	int ret = 0;
 	int i;
 
-	if (!fw || !mem_region || !mem_phys || !mem_size)
+	if (!fw || !mem_phys || !mem_size)
 		return -EINVAL;
 
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
+	if (!mem_region) {
+		mapped = ioremap_wc(mem_phys, mem_size);
+		if (!mapped) {
+			dev_err(dev, "unable to map memory region: %pa+%zx\n",
+				&mem_phys, mem_size);
+			return -ENOMEM;
+		}
+		mem_region = (__force void *)mapped;
+	}
+
 	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
@@ -434,39 +446,13 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
+	if (mapped)
+		iounmap(mapped);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-/**
- * qcom_mdt_load() - load the firmware which header is loaded as fw
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_region:	allocated memory region to load firmware into
- * @mem_phys:	physical address of allocated memory region
- * @mem_size:	size of the allocated memory region
- * @reloc_base:	adjusted physical address after relocation
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base)
-{
-	int ret;
-
-	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
-	if (ret)
-		return ret;
-
-	return qcom_mdt_load_no_init(dev, fw, fw_name, mem_region, mem_phys,
-				     mem_size, reloc_base);
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_load);
-
 /**
  * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
  * (typically contained in the .mdt file), followed by loading the actual
@@ -486,21 +472,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base)
 {
-	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	mem_region = qcom_pas_ctx_map(ctx);
-	if (!mem_region)
-		return -ENOMEM;
-
-	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
-				    ctx->mem_phys, ctx->mem_size, reloc_base);
-	iounmap(mem_region);
-	return ret;
+	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, NULL,
+				     ctx->mem_phys, ctx->mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 74886f772d46..f49de7b388bc 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,10 +15,6 @@ struct qcom_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base);
@@ -37,14 +33,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-				const char *fw_name, int pas_id,
-				void *mem_region, phys_addr_t mem_phys,
-				size_t mem_size, phys_addr_t *reloc_base)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
 				    phys_addr_t *reloc_base)
-- 
2.55.0


