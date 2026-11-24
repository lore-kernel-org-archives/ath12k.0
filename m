Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74F606A322
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AJGcI0xm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L4ayqnk4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d079nShT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS74bIfiRE=; b=AJGcI0xmlNvQY2SVXxa+kJzguF
	TR0cJIrhGAiF5LLQJdjRLGbjG3mUykrnNYgcvx2DAF9u9PEgz53rhByRLLuwTteBzJUcRaQk0pcTN
	P15AdEw1j7z+tqHIm/M7sPgZqm27NPAJumxpIfdqhRTzjPzreGIirlWOewerlZdf4h63XrtRpM3vD
	MojPhyDi19lScpnmjSmMc16ecqXnj9uX38UBP9Fxk2+UIEN5wzv28XhPqrU2pzSnw4hXXQuewkOQ8
	SqqvY5jm8YJrbFDLZjHmLdcF+hW3iGcL0wrWiFuvWlYAK7WxylIT0AxjO48pmMr5XELvGUKMUXFkS
	ZbSdwLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoI8-00000006Hgl-1E3N;
	Tue, 24 Nov 2026 11:02:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoI0-00000006Hfd-1em5
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 11:02:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAudfe1025371
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS
	74bIfiRE=; b=L4ayqnk4m5TxgGBfWewM72R9ZOlKRwQXVF0UjAOpY53ZaI3EO8e
	cTgDzy6UVynL5QDqEDLuYXdufir8MkjrBJcgtdtQWAUJM029LMoAqHgiJ8Eq2Ia7
	83FZgroMijiQ0T+uQLqWLFoEIZLKvvVsACLo1Nf22aqsAVkem6aaLWXDwzhIjyNy
	UGF9Mj0YQVNdxPu2+sifzJz7rSh1cShl7LvHTzKx1ZT2qs4MO20U10oTP4EUxqd5
	Mp8QVIUfqqY7CERv19ByeYYZ3SoiLajM6QVdHw9smr6ZEUK1QrVkqW0k+qb0J7SB
	Z5hEqlTVQ10IXKTzVm1WLPbV2uJ9TBxtPtQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2buh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 11:02:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b930598cf0so7370793b3a.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 03:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795518139; x=1796122939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS74bIfiRE=;
        b=d079nShTnozuH2W+dLYGcCufHkfn7xckvLsrLooqqq3VyKQZOichy/74PTqEiRnybq
         zrxHBoUtvtNpQoMqTbCv4UA5yLfxI6EP5rYjDRjUwLSe4wDryCdTJTlLG9CpbCSp7Q2E
         4OW7ZxNQjxMzFxsKfUNXj42xr/AMS8/s5ERvOuKeHizZ1DO1WiRrEMiZwdZBKYlE00Zw
         jqOW0elCzps3uFsu6JEvEwa5Lu8VJrIYkKj/m5QbQ3+0LNqPhId+fO0QLVhu3h7kYxOH
         q1BEhoKkPqcVns1m0YZBReHRj3gT9zKq/LhiY5x1UacGbyddlhfLEVsZh5NoYEch/CPO
         Ve8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518139; x=1796122939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS74bIfiRE=;
        b=L2xRBTPrdxw7gcipv9SaoRXXw0mJ+id1pw8CgV032mrIh+ypAvwWTCB+RKILny2ggu
         +dyF2un/bd6T9TPaXXNkBI3sSBCFAQRVJwPXdNqsEbryj6dCTe4tfPmzTFuBK17qaXKp
         j7s2br7k0WwW6V1V+HUuhT5K7mLlhiiTjNBKShfjktJVpWftTqjoTb3FaZorgY5C/CpV
         cX4ZRCoODE82BqBeq16MEwajJwgiV3LiOimJ1f7jKAXpWq4g62rBxw0UIL/cUIs2iYy8
         dPwWXmqbALLvlmP2pmIStARNMhGYIlVWyzxQYc5QcvcL/Gz1Hy6CZdwg19oOW0vZt5O4
         /uOA==
X-Gm-Message-State: APuU4Z84FQ22JdfjYbdQkIuggrfFBD/HoyR5xEI/+EnHecQ3MHTIymVs
	fMn+MYbc23dqoxJyrvzkHeVH65mJzoKk9CqvZWDEyzzt/TuZ+Z5Ci8ivFkdBZrPtSeHffo5m7ou
	fwGlX1jjtg2fQHvxWxGSAFtKMlE6+SilubUVfq+egpZ64rn1RDmoj9oaXJtO4BMmR3qRIf8SB
X-Gm-Gg: AZFdTZfgW/zLsaSpK6ab4Rxm5XEWcR9OGVJ1yHQ4PTH8FCbxAUs3sGwpPlKekOVpQON
	fY8e3vtM9Gkfes0rkhqApO9xhIOQSIKDMawMGUgIAE88ZNyiPsdylw4+B6osPgiKeHWbta7SmAE
	46dynrHMb1f9SHNSsiBd8fhRjqKFHykltLlojl4LSAzA/j9fVvZ7Ge+59QG2Gzbi1UK9DFQ8Ews
	7lgIZI9EsJMG8WRBZkyqCvUXbdWu8+V7aoafYXp+UGpf5SNXZ5wQ349q9tx2lHUFIBNKLqZNWDf
	vjZzzpIMXBDF8HoGl2q62dv/jTtxZref0oTcgTYib8zNvM3Mn5gzvE9+6x/FuGTP+NGBJlvj/bQ
	s80LGm7V4dVrJBuD3pJwt6iK1BZns5BVyRXPlT49P1mzwyfuNjtoAwcZ+m8/OMfoPflMo2lvZ66
	T247qW8Gyg9dOZ6TtVx5O0BxKual+IPfgekdgsMZjdjog4u3RK724BUcPx
X-Received: by 2002:a05:6a00:244e:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8c87c481647mr12818934b3a.35.1795518139129;
        Tue, 24 Nov 2026 03:02:19 -0800 (PST)
X-Received: by 2002:a05:6a00:244e:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8c87c481647mr12818897b3a.35.1795518138604;
        Tue, 24 Nov 2026 03:02:18 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm7087035b3a.17.2026.11.24.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:02:18 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: add entry for Yadu M G
Date: Tue, 24 Nov 2026 16:32:14 +0530
Message-ID: <20261124110214.594423-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX5ftJ/nCA5VO3
 inO9QBXPSsbQNXvNGv6+qjBbi+HF5RUplYdCNtCHQzzzeaMHTJMO4Smljn/frm9zSBprPsBr1VN
 P/Tw6vN9mru1K+5pVS2GjApovRbLV+o=
X-Proofpoint-GUID: 5PR2j24Yx47Rj2Rg2-1xbfhrT2CT8212
X-Proofpoint-ORIG-GUID: 5PR2j24Yx47Rj2Rg2-1xbfhrT2CT8212
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056ebb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1RTuLK3dAAAA:8 a=pGLkceISAAAA:8
 a=s8YR1HE3AAAA:8 a=QyXUC8HyAAAA:8 a=V_36NvZ-483JdQGStUMA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=kRpfLKi8w9umh8uBmg1i:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX/xq/6ISR5WNd
 OqSLM6MEgrFPH/GbKgBZhJX/jhhc0kLRaAVQYQ6uMSrqj/pdRQsu4YBVIKir11xyuc1l2BPlXeH
 o9W0FmTXLTtF+b6eJ9YIUcyXk3i7fOq3SSWKVZXWLC/LBVGEYQ/pLOqXoVFOYrg4+7E7VDD4iwt
 c+4bbbB4aTn9IQ878791SiwdRqyfWA33b8mhos4tFT6zBoUEkkaHFub42QrWuQIgJe6uTeaKUlb
 lB84bqadDm4uzoP0uUrKCU3B8GwNALL02Mc11BRZVEGL0X/SAZjJ7SEQ6FjFM84yvkspujh/QgU
 8X5iIkB6/yEQdFLbM6/mAhmxtKpdu28MpMJ56TCgWYkaruDVEierbO/sJHvO7NfvYb/zIR7DEpT
 aKvUY559JHU73ctdAXX6P7hGSgyez7+Pze0yn2H+8sEyeEKzuY/04ZWvdiAv0g31HGTYZ4VP06t
 acJY4RWCBHMLPjakoGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_030220_840207_22533891 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Map my old quic_ymg@quicinc.com address to my current
yadu.mg@oss.qualcomm.com address, since the quicinc.com mailbox is
no longer accessible.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index cda17fa320dd..a0b5c8ae1313 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1058,6 +1058,7 @@ Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
 Xu Xin <xu.xin@linux.dev> <xu.xin16@zte.com.cn>
 Xu Xin <xu.xin@linux.dev> xu xin <cgel.zte@gmail.com>
+Yadu M G <yadu.mg@oss.qualcomm.com> <quic_ymg@quicinc.com>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
 Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
 Ying Huang <huang.ying.caritas@gmail.com> <ying.huang@intel.com>
-- 
2.43.0


