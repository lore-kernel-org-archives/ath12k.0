Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3EB606D832
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sq4E7S1t;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM6UyPYB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN+Or0K8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=; b=sq4E7S1thWhTTA
	1vqpNPdD6ASO8m5o273BTOk3/qBNT5V+KRwkcKSKh6Ffp23poBL3tQ+UUMpZ083+2u/ilAkY3v826
	pCvhpdyS22+yMwS2ugVbILJa9nun6AleDXNw28ELsvTsTWE4Q8WoSX5MYuYF1HzdoDGIwG+bQ4Ec8
	qeY7yqaQCfY4ZUsdfEqlG+OtviHhYVQOaLhMkNmIF5YHQ3oYBiphcEbstglNTCmjRYlZNqWUHuOo1
	Py2kU2DfjAVBnfteQHAhkxI18MAamy7DASwuDiKg8Xn9TUMBrorrmKLpzy4bRxDWNc5V027uvcPK4
	Lo+jFIlL/YzFAAY9sIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWj-000000042ta-0nMe;
	Wed, 04 Nov 2026 01:10:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWf-000000042qx-07ip
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:10:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RMQn3335472
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=; b=fM6UyPYB2V2z0iYq
	qc1CwSIjDpeWo4p5H29X67tRSeQcAVdE0vwWdKI/BJUYhZOdAc4pXaqkSWgXfaCA
	o8s4FBSUnp+efxxl/eN0TTTTHaWpSGGqsTOyhJ7MhCCHvSsrhTGKfvNZqQ3z2saK
	5jr3IFKANFXiBCwsQYQUHy0BVPymT0dBUiUeySdwCscIv1fvF2VrWBCGneLIroBp
	H598VDAx7PSZKZ5CXk04prEQmFPOYOZs9b1qILIB/FagLP71McGc27EtUHPkwexa
	Am82oW2JMLkzcb9egd0aeYBGfrjqFjKvNO+69fcXi3CeE6ETU/+wCbyDxTkp3A1t
	eHs+mg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsf9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so584519eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754651; x=1794359451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=;
        b=IN+Or0K8YJc8t1MPec0Q28rUCZWvuxuzHNSTahB1EMP89vLaCrhExhXo8q+u1L1sh6
         SWrfOBWZrbiDA1N0V9e22SBdz4KzP7+p4Y7dERIm/BOeGxvlajx7mwk6Y8dphCNaeAM4
         I4KxojS3r+vrdgMhKH7CAUUVvZLJq2P+vMIdZ1KUk356pCi6OLRfWkg2GZzcR8AGGFhH
         Iqs0oPSnxHSGD80yrtS8lTmJSo/eFOeUpDPmrgQSrwCcNa1gGsqPxlRlOTTokcb9Co5V
         yCXAXsAtfZa5hYdIZY/4diN2kqnfBNpvgxzfGoB4oBcvzITUqmJf2sZUPjYKlNKHqdFD
         0kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754651; x=1794359451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=;
        b=cwpIThSum4flAqpxY1DG/IiQsUN3g3b+BZ0hr5SIeQ9mjRN3gy/dW1MVcIl35z2128
         h1AIv2qX3s0cKm61CMuIFxlpbrve6EQrnko2f+xLgD57tt9kzs26F2ESoi4XkSnkk0WT
         0OLe/9thHD4Wz5xWu8etUzpxp1J/JiXkAS5eCGaKi2Cc7LAgPVU1zaQuRRTHhwfOvWYw
         aR3rnPVjxIsLs/sVP6QN9CC8ZBDK/4qzDKgKis82TnA0VgEZC2MYV/3kRzmDgERAX5hI
         UcFx/2TBCu1axfSQZ6+juBQuDHJHjSlK3aW5vyhqg0bvehEhA1FExI/Pj1jHhl+oFw8o
         syyQ==
X-Forwarded-Encrypted: i=1; AKwUvByvty7YgkYQvQqbaTAmpevaLlYMhmTsXEy/TbllTaJXXPxC9Hl3JgAYDO/kZEn7VfwNS/OyEUc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/H69nMHrDzMzndG2n35QiXnjuWFKgiYNjl+ckD6Urw42DOAxjR
	I86pUb9X9dfTw6m7r8Cpwc8xKcubH1EAJNmBFDMaHjBps7YOS40mFpTtZtwsgATpc3xC0CQ625H
	PGUmLE5hXEe6ylBIC/+a4Uj/82pUund72PTstySUCEWFWQWJBMRrAR4WCAX17mcq5
X-Gm-Gg: AYBFou1uqCW0puwKzbMCWw23kPCAqsmRwt5Wb2k/pEzHbubF4//q2TbrUYcHVDSdR+k
	lZWjEKa75UfHPfwzI24dqlPXyZ8P4Len61Dtvxe+4V7SKLaJBRkWVNiAtQd/levuscWtEAW8nkj
	gz6Z8TBWudYKrduafDeeuwFg+Ush1sTBm8D4IojR5iUzXQt8AJ9cS73s7Asmq43rLupXAaJhCH5
	xPrgFKBuT0XLkqxlgysJSK2yqh3bmob6T57ujujXkh0MgKS4gPD9rck3ii1odNVbWwDduF/T92T
	KKRORP/E6fP+8ehMAZjsfyBm0bUkZJWsWHR5LBzdwuwOuuGnE5pVgdubDCKtMRcaDb9M6X0e2tA
	bVQZYNqfC7VkprCVINQxH0g3qNOfuyUDDxS1L0HzeeRCAWSYb5Le9V5lrPRJkpcEMS1GOUspYHS
	6UpExIXh6nu4ngpBQINtJsza92A9NG9KHhAnVo
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id 5a478bee46e88-36c9b356dd1mr3626631eec.25.1793754649766;
        Tue, 03 Nov 2026 17:10:49 -0800 (PST)
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id 5a478bee46e88-36c9b356dd1mr3626604eec.25.1793754649242;
        Tue, 03 Nov 2026 17:10:49 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:48 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:46 -0800
Subject: [PATCH ath-next v3 03/13] wifi: ath12k: ng: allocate REO command
 context before submission
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-3-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: zrhkY9JJgarbhJXpJaiN82H-ONat_FM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfXwXW1wwRqKaBQ
 I7pBCNoNbhDLGOcdfnLcOT4rHj6Rc3X+a67Re1qVATf7A4R6zebKKcROzDHiFmWhZLi1yGYSwdF
 IgvjJhwBMir6ctWBcC4ubnLiR04tj5QxD2KE8SEkXFB8qgv7tfLbRnh4K3VU7vOZ+fWjc2f7q6q
 5IT3vAB2Xicox4LXjffdG0MhesO17C9AiJD4Af72NxY4doZJYdmyk4kzfmXEfIkoasd7u+gk5WV
 OXjT8jRRUnl1jfjWa+EJXiNMEaxNFGseKJof4OFOEmsJieZrbuWN1yG6X1uwVy9iOT6spVWOEXu
 0Qgr+9kHZg3X4GnWsvsNhMIFGVQMd3NhTBk6iYRhShx+PYuvrp0S0d4OA8VAi9VwOFderMWBljo
 fXXCBmlgMX41iZgqZqzuuLUiJVLNBrQa7r+9W57Adrp9yBPNxKA84wkmYI7JYACyzp00H0oNV6r
 ERyUh2NBdZHFnHWCKTA==
X-Proofpoint-ORIG-GUID: zrhkY9JJgarbhJXpJaiN82H-ONat_FM9
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea861c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tQMSYTo8XKOll51RSuoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX1icGZd6D0n0a
 ppuDb7b9lVZEVcsHjdzU7ZarBLyAOQ5SFp0S5URwofCdDGBYzpf9JI9UGp0Cpv597EwNiCNoktX
 oVZ+o8Zq3vhw9E32S5ceCupPAll4+uY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171053_208556_D7D0D51C 
X-CRM114-Status: GOOD (  19.05  )
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

The Wi-Fi 7 REO send path submits a hardware command before allocating
the software entry used to match its completion. If the atomic
allocation then fails, the function returns -ENOMEM even though the
command is already in flight. The completion cannot be matched to a
callback, and callers may retry an operation whose first command was
accepted by hardware. This can skip RX TID cleanup or issue duplicate
queue operations under memory pressure.

Allocate and initialize the pending-command context before writing the
REO ring. Free it when hardware submission fails or returns an invalid
command number. Commands without callbacks continue to avoid the
allocation.

This changes only the Wi-Fi 7 command sender; the Wi-Fi 8 ring path
already allocates callback state before submission. Found during code
review.

Fixes: 52c555680bae ("wifi: ath12k: Move arch specific rx tid and related functions to wifi7 directory")
Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 35 +++++++++++++++++----------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a41049e7b425..d3ed2134818a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -148,30 +148,39 @@ int ath12k_wifi7_dp_reo_cmd_send(struct ath12k_base *ab,
 	struct hal_srng *cmd_ring;
 	int cmd_num;
 
+	if (!cb) {
+		dp_cmd = NULL;
+	} else {
+		/* Can this be optimized so that we keep the pending command list only
+		 * for tid delete command to free up the resource on the command status
+		 * indication?
+		 */
+		dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
+		if (!dp_cmd)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&dp_cmd->list);
+		memcpy(&dp_cmd->data, rx_tid, sizeof(*rx_tid));
+	}
+
 	cmd_ring = &ab->hal.srng_list[dp->reo_cmd_ring.ring_id];
 	cmd_num = ath12k_wifi7_hal_reo_cmd_send(ab, cmd_ring, type, cmd);
 
 	/* cmd_num should start from 1, during failure return the error code */
-	if (cmd_num < 0)
+	if (cmd_num < 0) {
+		kfree(dp_cmd);
 		return cmd_num;
+	}
 
 	/* reo cmd ring descriptors has cmd_num starting from 1 */
-	if (cmd_num == 0)
+	if (cmd_num == 0) {
+		kfree(dp_cmd);
 		return -EINVAL;
-
-	if (!cb)
-		return 0;
-
-	/* Can this be optimized so that we keep the pending command list only
-	 * for tid delete command to free up the resource on the command status
-	 * indication?
-	 */
-	dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
+	}
 
 	if (!dp_cmd)
-		return -ENOMEM;
+		return 0;
 
-	memcpy(&dp_cmd->data, rx_tid, sizeof(*rx_tid));
 	dp_cmd->cmd_num = cmd_num;
 	dp_cmd->handler = cb;
 

-- 
2.43.0


