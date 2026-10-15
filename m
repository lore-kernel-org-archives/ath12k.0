Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD58CC6B38
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AThD4YDvNlB8ycW1hV8nkngdrHMa5usDRa+Wt1AVu8U=; b=NmJhge2LYr94XGQCiOCtIsKU3f
	0ze+2DwShij71V8OMlxTU2F/nlt87pMkLF6Bf9W4d72luEErvb9N6RWTmr7tg1I8FCMlGpB+VyTsi
	uZwHsxF2hgsctniBzjLhgXogHNuQbzlDZyMFT9OAAbiZPCS5JdQ4bMQrRnNZSNoVWChqq7IfXUUio
	3ZapAWkYrQSz7UlTSmTl2NJEXoXt1YAVkhv3rCefXC+txaAEhaDnXIlUKlFGlas77JsmkGV2NYwu8
	raGHMxYO9eUEpn3ilImJ/KoOGY6cWzEU3A7CxMFI1fTOnXSh+YDfj+oFlXMxFAZGL4eEN/LJAOvS9
	jhCCNUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHERr-0000000Gu7u-139o;
	Thu, 15 Oct 2026 05:56:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHERm-0000000Gu6s-0NKy
	for ath12k@bombadil.infradead.org;
	Thu, 15 Oct 2026 05:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AThD4YDvNlB8ycW1hV8nkngdrHMa5usDRa+Wt1AVu8U=; b=ItBe00eUcacF/a+arHIFnHV7zh
	Y1RvQ4arN6lzQxoZ/iXMWdvEDyKBvE8kXLVSbi9uMUts7IlxgDT1DylcSIvN/aqxQDPrjUe+OQA86
	2uDTOT8QXFErKTQJ9JG/YlVXd5OZA7hTRLj8zCI4dkowJPyao3lGdMDANoXgfXyKjO6gNR6JAeWR2
	obbLuR7ORDnaKiXuI567l4Re65DPfC74aGKeW7B3TOlh46uioc4EU9DPBXlGbJDrJt7+vcBbRpA8G
	z3u7I0uJx25PacFtRwZbll8Zslh+NEjLCkJJUE2uC7tKAq6satBhvy8Rmft4xQYkpu+T34bFkN5Pp
	jeQte62A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHEQo-0000000HVJA-2I8R
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:56:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENQhLi585410
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AThD4YDvNlB
	8ycW1hV8nkngdrHMa5usDRa+Wt1AVu8U=; b=nhXATKdFK4Jr7sQY/w3UdWIInrz
	fGOHmlSsmhXYiNbGJEIZOj/zOaRD9i5N6kqvyKvFhtKnQNtGUaQNrJwTSTgmUfcP
	iiVqXJQv/CuLe1YYj7nnlphynT9tGW/eCHJbMaA3lLlK5JpDMmKy1t1dYXZp0E1v
	biazwqdxQ7g/GH41XMIcCagJOKGln/cSkfRWZFwKHOMaCw1QgpEtqXq3KuWYqEqm
	uHbbToYx5JuiStg1pQxWazLl15KM5CxKnriPZIUSpAyOWJc5lyIHimjx+o3yZ1rW
	iT6J1+QLjtH1Mh5J1Vj/nO80wzDs71A0Uqwo76O3oUEKfblyswU1iZ5S/tg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdes64m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:55:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso1138234a91.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043708; x=1792648508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AThD4YDvNlB8ycW1hV8nkngdrHMa5usDRa+Wt1AVu8U=;
        b=AkmtD7NKjaC3YNknZLCrVKtjb0AV2dccr2LAg16bWRWja20c5zIhEtpwnvE7/12bLl
         HgVbgB57Tw6xWPrENRl4rJOW9pIZUKkoh31npsa2Gnqsvo+tDZFucH4fIdxPcGmn3PhU
         JFlcK271S+FVh1oKPcPLlHOCI+DuPXSOdp/Q2yq+TEeqqwEd4DgDS3wFGxkMKzY2e6Bh
         shKBWZDigxw/B+s3l6ty+658ziJkuZPOS3/qKbbsF9biNzc1bbMUNpPK4CvvRxkrGGgy
         W23gjlFufLFAlXjcN2PY6Q/MJm7sbQfInSYtvw22tICu9iqghvlHeAPlqJFz2fqgdTed
         pGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043708; x=1792648508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AThD4YDvNlB8ycW1hV8nkngdrHMa5usDRa+Wt1AVu8U=;
        b=zXzALr4tuprygm/THXnNO1FJKR0Q+4R6km/k5FS69TWnLGvvSkizlKCleozNM4WROH
         D2mpZEPUlPleTGrOBCNXSVplmEiWsLwYP/R3I+O4HgePH+GfrTe/B2f5sWCSuX2Tf0ry
         GwsbAXlLVWLWyr2/D94PyA4v4cl0kBS7iSR62KRqebPLKEdWMsgM2VR8EtyojdO+jPsu
         MLxsOvMXCfd9KAHLpqijJwH1SjbGhcBLQdSUbNqpBLkqqNNg65La0ait1PE/taJ3lfLv
         m6Bva3heAx1h2gOoT4fDbQ7qsCmy1dgAJAVbra4FRkRlKTKrXXn9jIJwjQR0c0SDtW9b
         8K5A==
X-Forwarded-Encrypted: i=1; AKwUvBx7Vre5mCZxjsYdZsAWetQFo27yO6l5wW0VbpQ8d1RRDrjte9OWF7yFb28nZLYjVL749RP7CMU=@lists.infradead.org
X-Gm-Message-State: AFq9FYL6YHXa4b9KB9Ur2Rp7UW/kSUlBVha/HC44KC5Rf8X678ufkwmM
	BpfR9XMBAGSQJIR8SKgK9sUMBHRtYZmOOVwWu5kveMbTZ+bdtnks4Q7u7k2RC4+8xbi/k6KWGTT
	VcW2rTdQXxd+hhOZk0Ha01oIWtNAzKF4JuFg2gH76mhcCfGhy6uGwQNvYjOek4l95
X-Gm-Gg: AYBFou1uuLcHGnBopQXptmvTknYfV54Dmv8H5ruaNLTrBlx6pFSN/FNWWaVhWy2XOIR
	QvaUcl8JazoZmyJibwrfLu2aI7rivRFhKN28kTackzhx79VhcS4kF9oqJYpsFKW3HoH95pwEyj7
	Fu/ROI9FAJku9mUEAWKKv3uhqr6oUanT02GFR6leT+QveKUb6kO9VXl0w3sKNOR8DgJUqbWVSxF
	x3a9VC4z7cp6ZyLc01P4ZBPEz5vSiD6Dd3aFHQxxDXuGY/vuus8J9IbNjOs8g+qM8IbQYF1W8na
	RbZDLiB+5w57tXfny9fapFZhnLSYytBbBZvBtAmx9BkueRdLDTXmKzhbhyTkUK18j4bTOQMgb3I
	vvIIFykKux9/iROtt0nHH+wYTYkDr8fFd585GqA2nUCXWG0Yv0H44M+3gY8QarPAOk/da4OQEaC
	varFpRpAIDUC68
X-Received: by 2002:a17:90b:1d4f:b0:3a8:7242:e8d3 with SMTP id 98e67ed59e1d1-3ab3a2910f6mr15133487a91.7.1792043707917;
        Wed, 14 Oct 2026 22:55:07 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:3a8:7242:e8d3 with SMTP id 98e67ed59e1d1-3ab3a2910f6mr15133471a91.7.1792043707347;
        Wed, 14 Oct 2026 22:55:07 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2629054a91.15.2026.10.14.22.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:55:06 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH RFC wireless-next 5/7] wifi: mac80211: track QoS Management station state
Date: Thu, 15 Oct 2026 11:24:39 +0530
Message-Id: <20261015055441.680588-6-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
References: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad06abd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JzGhbOYYILsv2X2EDKgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 5f27q134Bm61YKOyMef2PHy0LI1jREQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX27DuTdpzyzhF
 K/FxiprDGjfj0z2+B2ugDeGqQSZhvoYMuRzlDk8EdV6NTfwr7Yr9R5fbH2Eibvoz0ScK4FqJW1a
 ijEYdlcmteRQAGjgmbAURnqGiucWuQSLj0ke7RTX4mnOiTOpKvZ2SprrdpaJpUSGZ43FP3MBTHd
 A4xGNtUs8Ij0GX+3tnCkAUGs9GMNH5IlD4EcKS44sZFWwbZWbQyK+iJ3AoD4/f+dKBhPKULrMNj
 IKYtN6lb0D6sYS+f2VRzTEXc85Pmihs7mK8+L7S3q/jfGDELLL9HQ8JWFBoMW1JD15kpbK8E3hK
 MAMOmInZ5TMVCRIO9kVHm8a7I55r0RUMl4OtECpcC5BTAzdfYIusUp349h8zcJwKu8G6Gvp+/pB
 hqbV0uVJKMoAtTuCHQ0L+hgK+Bl+w7KCGOpnF/w4gyxYKVTRsSwcHN6rDZ8EbrgiIBCduoKv0C9
 +H7k1xNCNFQwRoGzG0g==
X-Proofpoint-GUID: 5f27q134Bm61YKOyMef2PHy0LI1jREQH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX8wEF6vK1kMaT
 eiEvt6bI1Dz0W7qI62J53lKoOUNZMdRcW/GFdPk93UtrPzn9QymLKVJ2NORs9T69JhHVXDaoJRM
 pfLC2j+bFDdkxC0Ri0rNkZiqtbP/3e4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_065511_256662_A08BCA69 
X-CRM114-Status: GOOD (  25.50  )
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

Store accepted SCS and MSCS configuration in an RCU-published
per-station object. TX and RX paths read this state without taking the
wiphy lock, so replacing the object and freeing the old version is
deferred until after an RCU grace period.

The state is updated after successful driver processing.
The QoS Characteristics element is specified in 9.4.2.326,
IEEE Std 802.11be-2024.

Retire replaced state through RCU and release remaining state
when the station is removed.

Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 net/mac80211/mlme.c     | 150 +++++++++++++++++++++++++++++++++++++++-
 net/mac80211/sta_info.c |   7 ++
 net/mac80211/sta_info.h |  21 ++++++
 3 files changed, 177 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index e476c6b9cb14..2d853cd1c18a 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -12037,12 +12037,119 @@ void ieee80211_sta_rx_queued_frame(struct ieee80211_sub_if_data *sdata,
 	}
 }
 
+static void
+ieee80211_qos_mgmt_update_scs(struct ieee80211_sta_qos *qos,
+			      struct cfg80211_qm_req_data *qm_req,
+			      struct cfg80211_qm_resp_data *qm_resp)
+{
+	u8 tid;
+	int i;
+
+	if (qm_req->qm_type != NL80211_QM_TYPE_SCS)
+		return;
+
+	for (i = 0; i < qm_req->num_qm_desc; i++) {
+		struct cfg80211_qm_req_desc_data *qm_req_desc =
+			&qm_req->qm_req_desc[i];
+		struct cfg80211_qm_resp_desc_data *qm_resp_desc =
+			&qm_resp->qm_resp_desc[i];
+
+		if (qm_resp_desc->qm_id != qm_req_desc->qm_id ||
+		    qm_resp_desc->status != NL80211_QM_STATUS_SUCCESS)
+			continue;
+
+		switch (qm_req_desc->request_type) {
+		case NL80211_QM_REMOVE_REQ:
+			clear_bit(qm_req_desc->qm_id, qos->active_scs_id);
+			break;
+		case NL80211_QM_ADD_REQ:
+		case NL80211_QM_CHANGE_REQ:
+			/*
+			 * For legacy SCS the TID is derived from the UP
+			 * field of the first TCLAS element (11.25.2, IEEE
+			 * Std 802.11-2024). For 802.11be SCS the TID is
+			 * taken from the QoS
+			 * Characteristics element (9.4.2.326, IEEE Std
+			 * 802.11be-2024).
+			 */
+			if (qm_req_desc->is_qos_present)
+				tid = qm_req_desc->qos_attr.tid;
+			else if (qm_req_desc->num_tclas_elements > 0)
+				tid = qm_req_desc->tclas[0].up;
+			else
+				continue;
+
+			if (tid >= IEEE80211_QOS_MGMT_MAX_TID)
+				continue;
+
+			qos->scs_id_tid_mapping[qm_req_desc->qm_id] = tid;
+			set_bit(qm_req_desc->qm_id, qos->active_scs_id);
+			break;
+		default:
+			break;
+		}
+	}
+
+	qos->scs_enabled =
+		!bitmap_empty(qos->active_scs_id,
+			      IEEE80211_QOS_MGMT_MAX_SCS_ID + 1);
+}
+
+static void
+ieee80211_qos_mgmt_update_mscs(struct ieee80211_sta_qos *qos,
+			       struct cfg80211_qm_req_data *qm_req,
+			       struct cfg80211_qm_resp_data *qm_resp)
+{
+	struct cfg80211_qm_req_desc_data *qm_req_desc;
+	struct cfg80211_qm_resp_desc_data *qm_resp_desc;
+
+	qm_req_desc = &qm_req->qm_req_desc[0];
+	qm_resp_desc = &qm_resp->qm_resp_desc[0];
+
+	if (qm_resp_desc->qm_id != qm_req_desc->qm_id ||
+	    qm_resp_desc->status != NL80211_QM_STATUS_SUCCESS)
+		return;
+
+	switch (qm_req_desc->request_type) {
+	case NL80211_QM_ADD_REQ:
+	case NL80211_QM_CHANGE_REQ:
+		qos->mscs_user_priority_bitmap =
+			qm_req_desc->user_priority_bitmap;
+		qos->mscs_user_priority_limit =
+			qm_req_desc->user_priority_limit;
+		qos->mscs_enabled = true;
+		break;
+	case NL80211_QM_REMOVE_REQ:
+		qos->mscs_user_priority_bitmap = 0;
+		qos->mscs_user_priority_limit = 0;
+		qos->mscs_enabled = false;
+		break;
+	default:
+		break;
+	}
+}
+
+static bool
+ieee80211_qos_mgmt_has_qos_char(struct cfg80211_qm_req_data *qm_req)
+{
+	unsigned int i;
+
+	for (i = 0; i < qm_req->num_qm_desc; i++) {
+		if (qm_req->qm_req_desc[i].is_qos_present)
+			return true;
+	}
+	return false;
+}
+
 int ieee80211_qos_mgmt_cfg(struct ieee80211_sub_if_data *sdata,
 			   struct cfg80211_qm_req_data *qm_req,
 			   struct cfg80211_qm_resp_data *qm_resp)
 {
 	struct ieee80211_local *local = sdata->local;
+	struct ieee80211_sta_qos_rcu *new_qos = NULL;
+	struct ieee80211_sta_qos_rcu *old_qos;
 	struct sta_info *sta;
+	int ret;
 
 	if (sdata->vif.type != NL80211_IFTYPE_AP)
 		return -EOPNOTSUPP;
@@ -12051,5 +12158,46 @@ int ieee80211_qos_mgmt_cfg(struct ieee80211_sub_if_data *sdata,
 	if (!sta)
 		return -ENOENT;
 
-	return drv_qos_mgmt_cfg(sdata, local, &sta->sta, qm_req, qm_resp);
+	if (qm_req->qm_type == NL80211_QM_TYPE_SCS ||
+	    qm_req->qm_type == NL80211_QM_TYPE_MSCS) {
+		new_qos = kzalloc_obj(*new_qos);
+		if (!new_qos)
+			return -ENOMEM;
+
+		old_qos = rcu_dereference_protected(sta->qos,
+						    lockdep_is_held(&local->hw.wiphy->mtx));
+		if (old_qos)
+			new_qos->data = old_qos->data;
+	}
+
+	/*
+	 * SCS descriptors carrying a QoS Characteristics element
+	 * (9.4.2.326, IEEE Std 802.11be-2024) require hardware-specific
+	 * scheduling support; forward the request to the driver.  Legacy
+	 * SCS and MSCS are handled in mac80211.
+	 */
+	if (ieee80211_qos_mgmt_has_qos_char(qm_req)) {
+		ret = drv_qos_mgmt_cfg(sdata, local, &sta->sta,
+				       qm_req, qm_resp);
+		if (ret) {
+			kfree(new_qos);
+			return ret;
+		}
+	}
+
+	if (!new_qos)
+		return 0;
+
+	if (qm_req->qm_type == NL80211_QM_TYPE_SCS)
+		ieee80211_qos_mgmt_update_scs(&new_qos->data, qm_req,
+					      qm_resp);
+	else
+		ieee80211_qos_mgmt_update_mscs(&new_qos->data, qm_req,
+					       qm_resp);
+	old_qos = rcu_replace_pointer(sta->qos, new_qos,
+				      lockdep_is_held(&local->hw.wiphy->mtx));
+	if (old_qos)
+		kfree_rcu(old_qos, rcu_head);
+
+	return 0;
 }
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 5c95ffee257d..e714b719e2f1 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -467,8 +467,15 @@ static void sta_remove_link(struct sta_info *sta, unsigned int link_id,
  */
 void sta_info_free(struct ieee80211_local *local, struct sta_info *sta)
 {
+	struct ieee80211_sta_qos_rcu *qos;
 	int i;
 
+	lockdep_assert_wiphy(local->hw.wiphy);
+	qos = rcu_replace_pointer(sta->qos, NULL,
+				  lockdep_is_held(&local->hw.wiphy->mtx));
+	if (qos)
+		kfree_rcu(qos, rcu_head);
+
 	for (i = 0; i < ARRAY_SIZE(sta->link); i++) {
 		struct link_sta_info *link_sta;
 
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index 8942541375b2..68acd8fdc671 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -16,10 +16,29 @@
 #include <linux/average.h>
 #include <linux/bitfield.h>
 #include <linux/etherdevice.h>
+#include <linux/rcupdate.h>
 #include <linux/rhashtable.h>
 #include <linux/u64_stats_sync.h>
 #include "key.h"
 
+/* SCS IDs are in the range 1-255; zero is reserved. */
+#define IEEE80211_QOS_MGMT_MAX_SCS_ID	255
+#define IEEE80211_QOS_MGMT_MAX_TID	8
+
+struct ieee80211_sta_qos {
+	bool scs_enabled;
+	bool mscs_enabled;
+	DECLARE_BITMAP(active_scs_id, IEEE80211_QOS_MGMT_MAX_SCS_ID + 1);
+	u8 scs_id_tid_mapping[IEEE80211_QOS_MGMT_MAX_SCS_ID + 1];
+	u8 mscs_user_priority_bitmap;
+	u8 mscs_user_priority_limit;
+};
+
+struct ieee80211_sta_qos_rcu {
+	struct rcu_head rcu_head;
+	struct ieee80211_sta_qos data;
+};
+
 /**
  * enum ieee80211_sta_info_flags - Stations flags
  *
@@ -657,6 +676,7 @@ struct ieee80211_sta_removed_link_stats {
  * @rate_ctrl_priv: rate control private per-STA pointer
  * @lock: used for locking all fields that require locking, see comments
  *	in the header file.
+ * @qos: RCU-published QoS Management state
  * @drv_deliver_wk: used for delivering frames after driver PS unblocking
  * @listen_interval: listen interval of this station, when we're acting as AP
  * @_flags: STA flags, see &enum ieee80211_sta_info_flags, do not use directly
@@ -728,6 +748,7 @@ struct sta_info {
 	void *rate_ctrl_priv;
 	spinlock_t rate_ctrl_lock;
 	spinlock_t lock;
+	struct ieee80211_sta_qos_rcu __rcu *qos;
 
 	struct ieee80211_fast_tx __rcu *fast_tx;
 	struct ieee80211_fast_rx __rcu *fast_rx;
-- 
2.34.1


