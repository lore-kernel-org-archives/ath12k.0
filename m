Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6490C5AD4E
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=upwinNtdMd3vymLuU+w/2GiFaRHQvKRTnnSY3NerYyo=; b=A3928dLZYkw9eTRCcdAKQKJQXM
	6IABEx0NqDET6utf2w+7J3GF4wQaj0NuANYBar3kau5CGI1wIIfs3nkWHC5JOs8mTBUw1+WYtFPlq
	kG7Klq5LRETWYjRcKXMvpPycTxQWLGFO0+j7yDrdBGmKQ9hbGLiGVpUJ6mg4t2MOBbtVdJBVtqh9q
	RFFIn3FXTT6P8G12gVdPDd/l6SytxSWfEJJgWpWKNbAGXE0kWpNPjWj6p8yso/FupH4TMXPBCV+ez
	8Js3lTOXbN+6V4JXZSTT88df1or8D6NJOoNPJfHAE5d78tgrq+NKHRHngCRTiErFs+k5Y2Ggwrtde
	HkuREE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtK0e-0000000BAEv-1w4h;
	Mon, 10 Aug 2026 07:01:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtK0b-0000000BAEc-2Ugb
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 07:01:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pOZU385250
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=upwinNtdMd3vymLuU+w/2GiFaRHQvKRTnnS
	Y3NerYyo=; b=FsrbUgsgeDdXb3U6v20AW7ACsaauEZ2ngCkeZiwA+fuf9msBjsk
	VHgt91zuKqWCzp90ouFqGLKxE7pEo3wBb4ewlBYd9vvSpT8NiKqlDgoqQApFLyea
	O4dKlwuvHkD2XpOZ9dMOKe+7cWF2xDgJDy5cTXfOjk5LyZjcmO6XrcRhW3L6+cCV
	87Vw5o3NFMjTmjjQJQvv7xij0hGQOWb8PGoPRLYL3IyfjYbEqdmpAHKgQ+UMrAOT
	Z6maVlF9vSoHaSM6QFa+Jzls9plLTuuHxZT9wXOX6eE7tZTE4S+vaGXcZFcN8p8Z
	84TvRkqyOiP022FMC/GaLxCtH/dNvc2BwWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v586kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:01:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2038038a91.1
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 00:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786345274; x=1786950074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=upwinNtdMd3vymLuU+w/2GiFaRHQvKRTnnSY3NerYyo=;
        b=dgH7ZKy1ijkLLygMKay9nk64TO8KCqTZMgC8wdEUVYOP9s0j9qoM0YV3M09jSeaJJ9
         UHavmXYk6RFhyAO/vFVFTj+cQy6jtSkP1pMnqU4sZkF4Xb6Nwk14JYWT566gsswDJluR
         wMtZBLOvE8uBDJqAkm35vOe/qjxSzRlP/IIA4ma7f4RNNULDNRbIeQDZ4piT204F82IX
         xqZAG5jKjvyVAP6ySgCCim6K5IVhY4H6TKEOtiwHoc4t6nlkYZ6yiVR1BBSf15qNMjf/
         Rh5KVGISEKKOIFXjSVt9XZzvSCpW8IKhieSv6HBAZpkdkxJ19BLkVts/Mvjj8qSOXLlA
         BbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345274; x=1786950074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upwinNtdMd3vymLuU+w/2GiFaRHQvKRTnnSY3NerYyo=;
        b=cej0NJ3RBD9gztJkJhe+y4IBAUnHE9Qa+KyNfSerNi49CjKPPqm27KmTn5eVS6/Zii
         NgTjdGb2AgQwX5jIBlnf/SuefdtA8jNlSCXxnF9TADwdXTZFMqOgei2BIpte7G3IQgG3
         q2HzBAj8yQRwF/P8zVxFS/IgzSibxqSPk+XqfL5Y5+txR0cG++oPnouCAu7YvPYhXd/h
         xE0v7ZfnTu6mi8fPOJ4o0YeVgLXizs0PlvFexquYo/J3Tx6Db8tVMVzr9THMLoPRwnE8
         D3qSpQqb7nku+l/Lu2j2ftf1Ak9aZlO8nOtTAi93QlyPAtCxpevLVTkXCfAurTg0kulP
         BOZw==
X-Gm-Message-State: AOJu0YzXSBF70XU8rYGsCGDAKOswbIf8BGUpLF0AAoBV0qyF4e/XuFGn
	GOSLWo14ngx9qLQzNRHOhcgQ/Mw3GiuuLcvVsdJDimxARUNLYJdPE+wCBqvRUvwoa1dz875rV5p
	SCbVZLVCWpH+R5nXmcbrDY9ENsJ02LMd37dAnpEvn1hYA87iiKhpV/3/iqHFpFdWX/Vj12phI
X-Gm-Gg: AR+sD10CrE13C5Km1k8skouMQ2m8ExSJHXHg0lyaCL6av+F3gY5siO/Y/bolGLgahz/
	IUDmO2/BGl2mspxPpDbz0zuqqlSJseM3QP6pjsoCa0S9uzV1wVTExS4QbiHPmrtcAsb+EjziFD2
	J+XxylRM++NrKzl4bpqnFSDDaxU/FuZGgZDvqmiO+DFxG8efC8gEsG8FTuRXu3Evk+jb2BNnAgQ
	7ThBb2hkb7Auu8PqrhoFZBejGKOpXpL7DfZ8F9L5u2hCIOYYwtpPWZ5TBziORBYf5YAeHywBKud
	WQEmC/bw10aYMOmNZX8osbhWgpdOj7x6OZJ6OGGRgFXoLJPY3s4tcUViMh6aPWmULR1Yy3n41O3
	/FGraY+ko9pey8byj8m+DAuSNCHl2x3h7+TfGJxSUqzHvXh6xk2dT8KpSiNRapDKglZRUCM0UPt
	qR9xe5hS+xK8T7hqTQu45la6gXR1g5dQ==
X-Received: by 2002:a17:90b:5484:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-3903c581f08mr41480713a91.10.1786345274249;
        Mon, 10 Aug 2026 00:01:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5484:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-3903c581f08mr41480652a91.10.1786345273750;
        Mon, 10 Aug 2026 00:01:13 -0700 (PDT)
Received: from hu-srirrama-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm43670359eec.23.2026.08.10.00.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:01:13 -0700 (PDT)
From: Sriram R <sriram.ramachandran@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Sriram R
Date: Mon, 10 Aug 2026 12:31:09 +0530
Message-Id: <20260810070109.700301-1-sriram.ramachandran@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfXxVdNtmI5+luf
 OkhvP7BJqEAHJEYox9Wo0wGsz0TV2yVYFfz57gwGwhIkx30gIsGropUNCLDtPtEibkBkes0NdFZ
 BYwubmXj+lNQeaROWOLWL0TopYBvhVY=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79773a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=KKAkSRfTAAAA:8 a=0FD05c-RAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8
 a=ljim-9ewd5Kes9Jod4QA:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=cvBusfyB2V15izCimMoJ:22
 a=l1rpMCqCXRGZwUSuRcM3:22
X-Proofpoint-GUID: enhaMJE4phuiht7wWtIyZsv54VtL5umg
X-Proofpoint-ORIG-GUID: enhaMJE4phuiht7wWtIyZsv54VtL5umg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfXw5wAQu5bYQpj
 7lfZ/12Vo9WpOL2bR2fFXu1eO2dpLbJivKeBIhwnATJJHoix+QqCWbulH94nuK+1S760uoMCXcy
 q+Tk8zhqhNsDItWFyB06c2DOEKYfg9I94LaScyjui6hDCPoXfXeSdgWaDxosvgA6zL3IQd+X0Sr
 v0k3lm8sW+QNHe97RRiL8MziI6oJ9AlpYpwhlkeG896kaGMjiBXxMDuPCrfog7sPHzITma0KL8v
 XG06J8kYR42yCstzJapb98qDssAFmhVBqV+UAooQqv4V0O6c5SHOCdPSrK+3pV1n6gvNeoJPbtK
 M4SA58BDFahYR+2ZoCaX4OivbfVYVDEiWBAhs7pQBArtUfNDUDVieMG9rpeEkShpLJENgpu9oJv
 hwAF6M2OS8i19ZFzgGvUt3ZnpYVY8ml2CbFN4PFSL2YfyJLPwl/nJYMybkbJTks1IR+DdWwGyEf
 UW9iFE7u/Ib+ZdkF0vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_000117_645081_B0CEFC97 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Sriram R <sriram.ramachandran@oss.qualcomm.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a0f64c31abcc..b65c26e75baa 100644
--- a/.mailmap
+++ b/.mailmap
@@ -825,7 +825,8 @@ Sricharan Ramabadhran <quic_srichara@quicinc.com> <sricharan@codeaurora.org>
 Srinivas Kandagatla <srini@kernel.org> <srinivas.kandagatla@st.com>
 Srinivas Kandagatla <srini@kernel.org> <srinivas.kandagatla@linaro.org>
 Srinivas Ramana <quic_sramana@quicinc.com> <sramana@codeaurora.org>
-Sriram R <quic_srirrama@quicinc.com> <srirrama@codeaurora.org>
+Sriram R <sriram.ramachandran@oss.qualcomm.com> <quic_srirrama@quicinc.com>
+Sriram R <sriram.ramachandran@oss.qualcomm.com> <srirrama@codeaurora.org>
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com> <sriram.yagnaraman@est.tech>
 Stanislav Fomichev <sdf@fomichev.me> <sdf@google.com>
 Stanislav Fomichev <sdf@fomichev.me> <stfomichev@gmail.com>
-- 
2.34.1


