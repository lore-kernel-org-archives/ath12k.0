Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5D9C44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=; b=mTOqLeKYh0mt3vG/nFDJbRFYMU
	WQFaJdH5LPamaXnW7rHfZ/qK0LugLxETmK06W6aOEtuVfeXbjaYFFqJZD8MhCWCKbmBYRJfVIcInz
	cPuoUm+IokuNhGgv6HohoVHr5G9jxQ/jiN9HfYtXqLRqFZGAgpf1AIM+g7hbuG/FAR/fA/Qg9YgpD
	3nQxpCw0WXfXY0oJvAHhpAq46JQRmCs7kEixUEd1wYEZ+BxIPTVNrefmqqtBYnLkcZDucamtOshC3
	Q9pxlKTjhTHSCL2B28zpPecIegqh7S3NBFwFHjwDYEjt4wJdViNj31mzar3FFdAWJSOTs4iJg6kj2
	ZLZwAhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAq-00000008QwP-0SBO;
	Mon, 13 Jul 2026 07:33:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAn-00000008Quf-3g0w
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NqqX668838
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=; b=gDP2bzW7GYHi0QdF
	Qb51WQTYgI/QCT8OA6xf1C+ynNqz8Fr0eFVAA2oSIeUgsWUsHDyvXJRtBXSGkfon
	D0yUqvJku2qmVRXIE56IiVbxITv3K5uLias5tpEC6M/p3NamyNpHQmuLTAD5kNfw
	28TKH2NVoDkvfn42kRkyFJ+o3fd9yNoTnI5pH6hk1Pxipa9LRf/LE3mMIlw48Mq2
	MbsHxGG1iSxxvWCaShbRahONQYqF11c7y+33VZEnfyeoRmXNQ1xcy/NGYbexMadp
	18EkzEvRTYUBkMfyyXegkb+GVO+8yftr5WetdZOobXUxPvxVjP5nMzQ0h/d9rHEt
	9yPe9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1euc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cedd915291so1964835ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928033; x=1784532833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=;
        b=Vv1HLZkRJDBm7Ykn+KEUDeXRhPc+xWKK7NMXxZIHwA/DbMT1+ieKyPkrhZUJ9NxRD9
         jYDCe9xqJ40hoBTPg1aSvXQDd3Mvq/czKsJFeWgUG4R2oZ9p9wxPTAdUVf++IjJ0nU7x
         ZcqLNpJwnA5FFi3OZ0Bipyr7QMLf92E1Wl5Sr8aZe+NHjBwFaFhXZ5NjP0wzAKZ7ue4I
         32lnoiVOjIBpAGvEF3pU97Kjmw98NtK/K049dp8bU7Vuh0OIk3aCT1qBwMXXWzN7YZbB
         roIG9dhtPMr5oHPhpt8qvCXEx48C4mSJblU+ZNGAITFvL6sWyj6j3DB1fRh+03PKKuL+
         aD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928033; x=1784532833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slLVtfDbDJmYzwbjOSmqxM9AOyJ3tClD0VC9hBTruLU=;
        b=tOK41tKDzg2IEkFO6ZM6X6NaK5MgZIYZY/OmXgtCHjZDVWOb1UZUHxWB/zRnymbB3v
         Lb7vEivEtUMojUtL8aXQmIN6QzI8gcZGB0J4EV1OboG950RdBF7Pa3zNQ3K5F2SO/bp1
         BCSJX6OXG9MbxKpsCX1qXo/DLhd/tSYASrxclnPDwv7Z0V53YCMxOom1dlmNzqFLNi1R
         S6sTCHHToTTuc79uEmOkjHun8x4wddmzD1isaJvo8hqbwdImEk6f9NZFrPUFNv+/o6B7
         b/yLv/e+ohoYcxLOkWoOrHi1Xlpp7qYStxEmFB4XcBR3oWL91vSImYYk/dTwtMxZPZC8
         +woQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUPAp9RxI4OXzdgzTHj34n/ylOADa4RcMMHIO7FdoNyGHAi1Yd1P4IVLfpAjf1lZv/B/5z31E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo/ZXeLyIAjaqPmzOZ9IRk+8w+DHfr8gfBAPqY37h5yuX7wXl+
	i7KPtRDujKdoYOfq+5ms9gGWeWXKLPSsz5tao2/uBx+p7DtquGG4iI3l47ehYdCVGf+75TlhOlP
	4OC6dy30lSm68pp83AhTkxOQTawEiNTxGqXsRrbHkJ6DOwcyrxwVdA87bchwobckX
X-Gm-Gg: AfdE7cmaUYIrX+BoFqO58iPsyu/wqbgMWtIlW30/6YZYwquchEZp9IElwuxrtp72uih
	QNXY4xVPJMqJ5ET8f+uPMfEKKLgYJFnBIme9sJoWN2eukjwfJcXelDbyP5rnT46aDORtZpmId2U
	TtastbQjfIQn81HZileXQeVcpWf6w2GQ14RtI5A3lN2IBTesiExJy2vnmgwAhu8XjR90Umbv7p2
	A/92soJXK2uTO7nIS81Sude/c/bXMEBmpdbj7X2d7EFQ6u2K6ps3AoEulav6dbI9n7tia/dbTaa
	30as3NKrTZl6zGwKpmvBfIibMh6+lfuJ7ckGeHuEUDzREbrNIZITZ7jHBPdDTJmSfla2f5uRdRX
	T3nroBW1bz1HeoXzl+ruXfZLMdScI2ziGy7iT+ahlBq8jDUgvTX2MQfvX9GZe45Sj
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:aff5 with SMTP id d9443c01a7336-2ce9f4d41acmr88512305ad.46.1783928032652;
        Mon, 13 Jul 2026 00:33:52 -0700 (PDT)
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:aff5 with SMTP id d9443c01a7336-2ce9f4d41acmr88512045ad.46.1783928032226;
        Mon, 13 Jul 2026 00:33:52 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:51 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:21 +0800
Subject: [PATCH ath-current 6/8] wifi: ath12k: do not advertise MLD peer ID
 for firmware-allocate devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-6-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: xpx5lnemFIJ4kgLOk9_UqqPTxVv0FtbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfXw6j4P2mEq9RF
 Nq+ZmEbyc9kC39nz08DQ2MbkYwFInaE9s2MZjviFOsvjl1CVcpMPiKOsZaKW7Ei1oCuHdYARenC
 OGsb3vDoXbLERK4lxLaY8vYjzEzjAZi0YrGFPtGaDN5Uuz+EIuzcJi2TN/tCY6ua1ppQsGr6hao
 dxDSQ/6MoEMVnUzOfjSWcUU+C5u6JsSp+57PCTgGQjrzwDw9imUDG6xx5oAeuefYJn76AKErpTF
 Vc+eeU7WhYagypYadbtb5LOOe8ELAsRm6P36kA0+nYl6rHS2+W5Ne95LLRXZX79GgC9fe1rvLx6
 Dkhn3IY1BlcKU5Y/mTXs75r9mOVMXVQ+irjU9+kcH3IQpX+n9huunQrS/Eig/AmOkCMk1Q1Thu7
 GbxmSZXDe1CNkSbAfxZ0f7OaTLLCOqf6UotE1mMymrcywCmDv3s3bR8Bc0D34OfAvCrViTG9O4w
 HCHyfsMxagq8LDNa1HQ==
X-Proofpoint-GUID: xpx5lnemFIJ4kgLOk9_UqqPTxVv0FtbX
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a5494e1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zO7lKvSgDLHZEP5-WbMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX455wCO4TeUiE
 NbUKhLb+VaibPNS57vEqQCLQrTd7vpmUy1o0qivY1tdwFiAkM+oAD3/CH/QN3ekb84+Jwphc5sU
 iolu5bXmrY1NFtAGMz83Hgsg8cppM5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003353_911199_24170FE2 
X-CRM114-Status: GOOD (  18.47  )
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

ath12k_peer_assoc_h_mlo() unconditionally sets ml->peer_id_valid and copies
ahsta->ml_peer_id (with the ATH12K_PEER_ML_ID_VALID bookkeeping bit masked
off) into the WMI_PEER_ASSOC_CMDID ML params, which causes
ath12k_wmi_send_peer_assoc_cmd() to set ATH12K_WMI_FLAG_MLO_PEER_ID_VALID.
This needs to be gated on chips where the firmware allocates the MLD peer
ID:

  - WCN7850/QCC2072 firmware always picks the ID itself and does not honor
    a host-supplied one, so the value would be silently ignored anyway;
  - QCC2072 firmware additionally crashes during MLO disconnect when
    ATH12K_WMI_FLAG_MLO_PEER_ID_VALID was set in the preceding peer assoc,
    so the bit must not be sent at all.

Branch on ah->host_alloc_ml_id:

  - When true (QCN9274 etc.), behavior is unchanged: peer_id_valid is set
    and the raw ahsta->ml_peer_id (without the VALID bit) is sent down.
  - When false (WCN7850, QCC2072), peer_id_valid stays unset and
    ml_peer_id is sent as 0. The firmware ignores both fields and reports
    the ID it allocated through HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP.

The early-return on ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID only
applies on the host-alloc path, since on the firmware-alloc path the value
is ATH12K_MLO_PEER_ID_PENDING here, not INVALID.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9e5fcbf8c730..8cd5e9b15db5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3529,11 +3529,16 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 	struct ath12k_sta *ahsta = arsta->ahsta;
 	struct ath12k_link_sta *arsta_p;
 	struct ath12k_link_vif *arvif;
+	struct ath12k_hw *ah = arsta->arvif->ar->ah;
 	unsigned long links;
 	u8 link_id;
 	int i;
 
-	if (!sta->mlo || ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID)
+	if (!sta->mlo)
+		return;
+
+	if (ah->host_alloc_ml_id &&
+	    ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID)
 		return;
 
 	ml->enabled = true;
@@ -3541,16 +3546,25 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 
 	/* For now considering the primary umac based on assoc link */
 	ml->primary_umac = arsta->is_assoc_link;
-	ml->peer_id_valid = true;
+	/*
+	 * Only chips that allocate the MLD peer ID on the host send a valid
+	 * ml_peer_id in WMI_PEER_ASSOC_CMDID. For chips where the firmware
+	 * picks the ID, leave peer_id_valid false to avoid unexpected issues.
+	 */
+	ml->peer_id_valid = ah->host_alloc_ml_id;
 	ml->logical_link_idx_valid = true;
 
 	ether_addr_copy(ml->mld_addr, sta->addr);
 	ml->logical_link_idx = arsta->link_idx;
 	/*
 	 * WMI_MLO_PEER_ASSOC_PARAMS expects the raw ML peer ID without
-	 * the host-side ATH12K_PEER_ML_ID_VALID bookkeeping bit.
+	 * the host-side ATH12K_PEER_ML_ID_VALID bookkeeping bit. For chips
+	 * where the firmware allocates the ID, the field is unused (the
+	 * firmware always allocates regardless of the value here); send 0
+	 * to make that intent explicit.
 	 */
-	ml->ml_peer_id = ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID;
+	ml->ml_peer_id = ah->host_alloc_ml_id ?
+			 (ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID) : 0;
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
 	ml->eml_cap = sta->eml_cap;

-- 
2.25.1


