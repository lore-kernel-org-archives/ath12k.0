Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9D8C53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=; b=MjcGmTuboRbNXfydnTsMJ0gps2
	Kj3nZ3SkvZr0w91yQ/aate3OEMFofLX8i4yjajAYD6Lq1SX7uPeUMNSUGv1GJ9ozYOIg0gXapW0WQ
	RtcVEvMjHc+JYvRattF4VOfNyqMYWED3tCar9pRuXThSOlte+Pz/5yTw9Kil9s0ERYK3FaQsX4yoC
	EOrQcYY5M7O48i9AgGQ4ULqHCwsD4E4K2WFu3dGSXxEaBoGu6EYSjTbv6dQWnSClXKe+6738J2Sm/
	BtCW8y19KvE94OHHszZus0t9x7P48DifLHK2zEpgslkfwveHV2e/UIMXGuytOKpnguVwTvXLz7xGL
	7YRSzMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6B0-00000008Ovc-2bwN;
	Wed, 29 Jul 2026 15:26:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ax-00000008Ost-3zTG
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:26:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF32h02357627
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=; b=j0WjjaTpS+tOMc7j
	me0QeQjyiUzB7d1Z84iSuBb19qsVMR0jnT1j8kA5e7IOh41NfpsUES27gsrinPBg
	PAqYS/ICmSpLe5qP+0YNhF51a9HKWtiVueCmtH7ilhi4GKbcs14Ojq1eO/Ph6kxW
	VKDXhGHYGMZ40wmO+mD0Yk7Z8kdGCnXjLQpp5B/u/cEqlVLfDffuuTpyR0h1G7tO
	APuTGtT4bZSqBVXrJfEy2M04OVs4OoGDKOlPk0cm5SOvoI18FdPjsDUBKgTQ6in0
	0pJIV9sXDRCdnrW+YCv06MS0IgE9oSqA1M4gJp1gyPu9ipRQvXzWhbMEehKtGd3b
	j3bBqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe98ygw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1517969a91.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338791; x=1785943591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=;
        b=YDvQiPkD+SqFAWFN/qzdIV14n4cXYhw14qvgkQuRzYw0mdnS8T9QhNAfu4yNMHmn9C
         3x2QMlJlNET2kzy8k9E2oZsFtBii1EclpDc8GF89j0/YkEGdZ+BpXEpArGjZqh+g3IUt
         9ZfkW5HIiIKqzdDYTacqipQ6uMUnGCDaT9Dwzkmg9UZKuIcT5syX748h2Hq1FxvX9SE+
         9WM+uJEBPDR6fMO/0LffcVgpdAb4tMHyGqVodnOpk/JUYxqu+QtmVzmqbeJca0zsQUFE
         AwNloipnu6qHhxFAlsZs9W/FkVprqUarVuAwKbgwq2ZDS3YPbI2wGr40+Ar85jQwxXLB
         GjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338791; x=1785943591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7OCiOhUvbS8MmL9dYvzzL3m6qD2Zu/mwC+MTVmjD4g=;
        b=mGNCZiEBG/bDbFpOpPkJo1ulKZqY8DCa6yS15/dh6FT6GXQpUgVmiIKQbKYuRGFrnV
         USCtxu/YpFTfASkoTqv8Fwd8MHnK/XkY+UvCsBi5VaNJsTQHBeXJKUsi6327ud0HGtFS
         wWttHxeueYliAbzWDsuL7y9Zz2vgFd2KJwnaL9iB4pe7XFZ+z7VfZbbXTC/d2TVo9S0l
         6HtwkFJ1hG8HxYJ10CbPyhVU9THiKvNzcX0aUuCDkkHJDDlOI5s/43r/iCs8jVPvcSgU
         jqW/T6v2687XKrGb0juXFShKnRaGqYi+4tcrWsfktP6OodSDe7SRXl7lbXrlTM5DVDI+
         skLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBk94FV5X4NJks/0u/TGx8wi3t46j2OvLZV7CkUyIcRjkmA/uM2m1x7vvUDP1A3OpuQ7XsfSQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YykEJfTVyv81PPv4Y6SEjzr93OnmhBjSvwPTgvP+ZlMbXOTpkWe
	O6SuxEJ1mLFUtFuvmuwSpeuHqho3GZAOk22fNsmPb0oHgwWntk9ZoMgiuCIuChzGSab9Grb14tR
	v22g2ZkvCfNRIwSrPcqHkK7DKmatUP6F2wA/0dYCt2N4HT3gAmUW7CZ0ZM4smNiGbzV6yT+m3
X-Gm-Gg: AR+sD11KziSmyLXkyFy0PmpOnx361CWaorrSb50Lv01qCfUQ5lq0amspgo/rJkKPZs+
	UC46PBOKXX9AcNdUattQ2DY84Csk0vvT+a/o6qSl/gx60eM+JTGb9mA1uDPXwvWEoG/c1cdJY7y
	vs41SOCgjOGW5L8FrwZ3xEQPu6KR7wzX2SQK/494sddBkmVPuHBRotUTvqnZZha8qzP5uI8OoI3
	MUdOvp4sdC1DUC8wM1Q9vBdm3cVj2n3PEMqy+080/P0rewtXbNg10JHwhQSnHf1UM1AJAhWo+jn
	YKtvdwjHXtmfXsaWqZypvTQNy4ZK3Os8Fsxt/nntSJ8iR5Ap2wWywT4zyoJqVV4ZJ2nRPwydLeX
	DF/6Tbv5oAcM8Hg6wTy4kMoqB7denRZbFghtWFP/+tlG1DKeNCmdEAvA=
X-Received: by 2002:a17:90b:5146:b0:38d:3ca9:434 with SMTP id 98e67ed59e1d1-38f6a426f70mr7781893a91.28.1785338790930;
        Wed, 29 Jul 2026 08:26:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5146:b0:38d:3ca9:434 with SMTP id 98e67ed59e1d1-38f6a426f70mr7781857a91.28.1785338790523;
        Wed, 29 Jul 2026 08:26:30 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm18005300eec.25.2026.07.29.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:26:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:26:26 -0700
Subject: [PATCH ath-next 2/2] wifi: ath11k: fix stride mismatch in
 mac_phy_caps_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mac_phy_caps_parse-stride-mismatch-v1-2-077a1a0c50d8@oss.qualcomm.com>
References: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
In-Reply-To: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMyBTYWx0ZWRfX0+f37byduto9
 fMmvMbMMVmhO53fGiYUFe9k6l4puyq20AI/4VkY1OwMj3dP4cuCUtLEj/dBp2mozEewy3U/QokK
 O/e/JjFdrXpchqpyd0JF/SL1GCtHnbr9mPwgyZbOtgsU5I2rCz8yPGrprkiEs7BJpsQ/RwWaags
 i3e9Nmji0D8DW4uQ8XpfY7VBHqilSSv1V4DSQQiHZ3OMxaBHtVZJSiNnzRyfxZRySrIVIjnqcYf
 NrBsR5aJ36MlV0gRyWBj7Evs1sSAl9jlAy3mJp1yLTRG+QiWCgGzjAPlQKrq7s9jDi/CT1NwrEp
 7SCRo7jBjhA5B9rGk93nsIc/KUrauxH/0cxeJTFfkexaRnDU30KNDdYIbDJTfzPiuZpSdCSud0A
 PK4EEhWxBfoUvCGxeGXy6LWeKKynJp75lcR1XB7lz0TLNgIx3MbT8TuJxFHrflYv8KHvzqbEEbq
 HGQml75gL+3Z5TmsmNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMyBTYWx0ZWRfXwuEG6oFAIIML
 JwYgqasgrnvgM4Z732LFHKbw9Oh77E5f6hPEyX6qNT4klmW6tcdsaG9Wt3GZeH8bchbr4BsMnEy
 SHB54069GgjlgkfYbO/nRgbPuIc70j4=
X-Proofpoint-ORIG-GUID: wx3CcMv0cB5U1LO7-ged9EgoDMm9Wti3
X-Proofpoint-GUID: wx3CcMv0cB5U1LO7-ged9EgoDMm9Wti3
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a1ba7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y0DE-vWUm0S5MY-z67AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082631_990649_28AF438D 
X-CRM114-Status: GOOD (  13.49  )
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

Currently, in ath11k_wmi_tlv_mac_phy_caps_parse(), kcalloc() sizes the
mac_phy_caps buffer as tot_phy_id * len, where len is clamped to
min(firmware_len, sizeof(struct wmi_mac_phy_capabilities)). The subsequent
memcpy() destination advances by sizeof(full struct) per slot via C
pointer arithmetic, not by the clamped len. When firmware sends short
TLVs, the second and later slots are written past the end of the
allocation.

The reader in ath11k_pull_mac_phy_cap_svc_ready_ext() also indexes the
buffer with full-struct pointer arithmetic, so the allocation must match
that stride.

Fix by using kzalloc_objs(), which derives the element size from the
pointer type, making allocation size and pointer stride provably
consistent regardless of what len the firmware provides.

Compile tested only.

Fixes: 5b90fc760db5 ("ath11k: fix wmi service ready ext tlv parsing")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2d2c6d7a4a3b..f80e9b4a8a39 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4800,14 +4800,16 @@ static int ath11k_wmi_tlv_mac_phy_caps_parse(struct ath11k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
-	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kcalloc(svc_rdy_ext->tot_phy_id,
-						    len, GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps =
+			kzalloc_objs(*svc_rdy_ext->mac_phy_caps,
+				     svc_rdy_ext->tot_phy_id,
+				     GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
 
+	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;

-- 
2.43.0


