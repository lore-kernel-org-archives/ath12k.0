Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2429EF06EF
	for <ath12k@archiver.kernel.org>; Mon,  9 Feb 2026 02:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=205OA5oxq0O7kM0cmJSQ6t22RiwN3B+sfSfh3ytC27M=; b=Vg9A+vR+nd/d6m+aWdlNam9RHA
	nckFF/1fPMIX2tyfW8OHWRMxASQQf6Ad16zaid4XFjK7GyRVQT5mYpDLxwHeYYx+U/0tE+MNodYcX
	LPHjAjqOj9JHxF0DvVQ/kzM57wKm6DUVVFEoxeZ3mqCXNY5fM69q9gw+6DspswbCJ8qPml15st0Oe
	WU6jf/PwZv/x36zK1EyUvu/OX+88BkCN5ss4sPF2PIj63NiGAo/2A8AlJFQxx9ZryujgrW6Vic6ld
	+jN7E2cDzZYmDaEU3+wT153NnnRcXQPQh5QFIeiRJ2FNkqfPY/EQ8paKxamh5WGyXRUb/0Zmn+Czw
	N9quE6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHOK-0000000EjYu-2jvD;
	Mon, 09 Feb 2026 02:52:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHOG-0000000EjYR-3WWQ
	for ath12k@lists.infradead.org;
	Mon, 09 Feb 2026 02:52:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618ITxvI1927738
	for <ath12k@lists.infradead.org>; Mon, 9 Feb 2026 02:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=205OA5oxq0O7kM0cmJSQ6t
	22RiwN3B+sfSfh3ytC27M=; b=Q0fqixNememtMIj56HlQ2kDRGjCG5iaYjUhLMY
	JSU6o5QPJjNX1gfU/rJoQcKF3yg321CxeAIR9yYKcvpKz4gtJ+nOwMBsXxQH5ozt
	cXugQ0d62RNRhjTLnZO+Qbx1S92czvWSGUM4R/PIK9CoAHdGoIBHYW7H4Cd67Eyw
	8JbX6WsnO5lI21S8W4dRy1qJCyVmlzhXvBIXmZ1tG8vXDVRDf8MUyPIREGPVTHGs
	amOsRbz9xIMh7BJ3QuRmprkQO3d3nbeavYR6fATeIM1/EQWeLWgVi/Tt8NUnk6Um
	tufxFEN4V3o4NzzuH9wFYh+1UsPwTR/ihZxeccQv6430dsvQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb53e1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Feb 2026 02:52:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a75ed2f89dso25368135ad.1
        for <ath12k@lists.infradead.org>; Sun, 08 Feb 2026 18:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770605563; x=1771210363; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=205OA5oxq0O7kM0cmJSQ6t22RiwN3B+sfSfh3ytC27M=;
        b=hGioVg8GNAd0NYcI71ArUFj98tSZcA7gmL2tqPWaF/gTclrTAduFZsNTdqvat9Q1XJ
         6kijzeqi22wvDJiQGGsFLhpgTBVzXUTX8KLIpzCGep7EJBbA/Rge6eSnTl9rlOJ5dN84
         uVe8QgdsHhfQjz/T96nqokX5EvEy+vrDG9sAaOpcu6qxJK34J2oDC82c5JdWgQ39leLl
         dM2prhrP/3KtWBu5zPMZNKX0EbfRz8QZ9N1hhK97auc52QH8wDm4WEwE3fvBSYYNxB8N
         4qGo41sdJJXTrmglwey0E250l8MpExubP8KUQo3znMzWdUzgBWsWqLBrri8aPiXHyojI
         U/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770605563; x=1771210363;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=205OA5oxq0O7kM0cmJSQ6t22RiwN3B+sfSfh3ytC27M=;
        b=Dfr7hvdXmhcjGjI+Jx9n5kOTF13OcTVa7nodJUa1WQkeCT7tc6Yg3BJWURmABoFlEC
         WtxUuCuI033dhHDPKSURxz09piYomkSaUY/pFhuORwASZK1aB2IK6xn/07myrJ/lfnuN
         lyU62dLjNSgAXue6CZt0h9hyIRQ60ghbOvEqakVQGAwDMWiaGaxQBhO6Mwzy37bcxZ70
         CVTtdSbU9Z5GGa9UakyY3Ym8Dvd1qbIfEvPwf/lcokzlOopEHXpgTjZFTNN8R9pBTzIs
         fjARNrX1ggkd5DT193BXpWiLLrL3Y1ymflftXFQufCso3wXc8/a9eiJSICTIHVel6hHz
         il6g==
X-Forwarded-Encrypted: i=1; AJvYcCVAAPMN6YoCemxC2VY450bOutUVy9k04vz2S/STNk4Nn9JY3oNUnX571DFHlj2+g36i3KsLCUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHw/gKdb+2ppQpcoiw8HUrH0o61gPmcUYssd2k33WQvIiYnxJ+
	8Xols4iq/8jVU6JU18Wk+pLDCm6wj93Wg/t1qwDB9TWVTztG9drwRwjpqBMxt+rSk6bYIjyM47Q
	a/XuFjSd+OKDIOp1ZSCFZN+CuKvVxCoHy48W2cpxGovKgSfJGYDFWn0tGgiF4KysY
X-Gm-Gg: AZuq6aITBjUhivG7eIiv/n+n90U5fnbaVvXQpvLLKD8MD0a3QN3FB703NEDTmeS0LyW
	lkYtG3eO101MSa78tu5PMCe0Q1LUGjTGMsRlV0ZswpFTeGdUAVMY/6+gCkO8jqXO7M9QBud/hUv
	13I50/o5ed8+buVvu22LxTt0ZbHTWQDLgin5QdtxpPtr8viY32Zpi8ONInWUVwG9xUPVUCEFQxo
	PDkciZzSUGWRv+GISxSlWhJQWvlPlhLjS2mMeWBb6jTKli2vWDHIZFs9OsJ3gAOUu0E6NUQRzgs
	p7nI8AAXd/JyWxx+FI7JCe2S5rDi7KTAyuYFMVzIFosIr/twVOwkh56LHdh2kRVVK2q1gUypPYP
	NrmYJwQ8wy7531u3zTipO2vstQtg53dOr1yuUzwuCbi4FO0H4HIpMy8lVZ5LuCeY=
X-Received: by 2002:a17:902:db03:b0:2aa:e843:ab11 with SMTP id d9443c01a7336-2aae843c243mr21123655ad.28.1770605563316;
        Sun, 08 Feb 2026 18:52:43 -0800 (PST)
X-Received: by 2002:a17:902:db03:b0:2aa:e843:ab11 with SMTP id d9443c01a7336-2aae843c243mr21123505ad.28.1770605562437;
        Sun, 08 Feb 2026 18:52:42 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c4d8dcsm93211185ad.9.2026.02.08.18.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 18:52:42 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 10:52:19 +0800
Subject: [PATCH ath-next] wifi: ath12k: fix indentation in
 ath12k_qmi_aux_uc_load()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-ath12k-fix-indention-v1-1-6b87ae99745e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOJLiWkC/42NQQ7CIBBFr9KwlgamDTWuvIdxQWGwRAsKSGqa3
 l1kbYybSX7+f29WEjFYjOTQrCRgttF6VwLfNURN0l2QWl0yAQaCARNUponDlRq7UOs0ulQAOhq
 UUvQjG0CRgt4DlkHVnkghqMMlkXNpJhuTD6/6L/Pa/1ZnTjlVo4Fuz4zuhT76GNvHU96Un+e2n
 OrN8I8LPq7OoNA4aAP4xbVt2xtZL4Y1FQEAAA==
X-Change-ID: 20260206-ath12k-fix-indention-bfeaa64b072c
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=QMBlhwLL c=1 sm=1 tr=0 ts=69894bfc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VpXjoHvSS6b8BrFo14wA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: POGapHx56qTg_LlCd8Fa100Vx1_XHa7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAyMyBTYWx0ZWRfX8uITH7Jfph7s
 ra5J9tnQVBppzrzFCg1pewoet/+qO+Drgw/vJivPZkNI3yza1DkAIt7+zTF2xrcouTwHB8svNGa
 zm8UpP7aSpS2zZ/Hqd9Eem2/VTvxV8HzT7+KcLuerOGeW0klMEx7bCyUTxsyfXUUDmLXAQnI5BR
 BrfZCCrYHmZwpPPe3+GYE/L90rg33RfmU1iyZujyNof53zHz7QD7OVDA+xp1gXeLLAyqL2YIMqe
 8n6vycvMDifyCxc5xjsSVkcB86MAAb7oz21Ftf3d4/49rEVEx3q2iTPRW+3s1XAJ4u69X0mNfqB
 AerTffj+Wu4qUcC0BS+ruGUGCeosvtKxx24uy7ZMiY8qJ6DrGipvfhe0kJ7hJ/njfkTlrcbQlkM
 5o8z5wKausRx0v3D8+6iO4LXwOkkZ5e6TPOwK89CZ39BTHwlO2GmPpEIBCpNZXxlkF/90SBFTNa
 O/pP/Pyw67oNjttBsCg==
X-Proofpoint-ORIG-GUID: POGapHx56qTg_LlCd8Fa100Vx1_XHa7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_185244_891918_C12B1981 
X-CRM114-Status: GOOD (  11.95  )
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

Smatch complains:

drivers/net/wireless/ath/ath12k/qmi.c:3342 ath12k_qmi_aux_uc_load() warn: inconsistent indenting

Fix it.

Compile tested only.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602061221.5SCuwKhy-lkp@intel.com/
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index cfde4147c8fc..41f53d34d33e 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3339,7 +3339,7 @@ static int ath12k_qmi_aux_uc_load(struct ath12k_base *ab)
 		goto out;
 	}
 
-	 aux_uc_mem->total_size = aux_uc_len;
+	aux_uc_mem->total_size = aux_uc_len;
 
 copy:
 	memcpy(aux_uc_mem->vaddr, aux_uc_data, aux_uc_len);

---
base-commit: d9a2be2d72d4f9035f0334e0ff49180fe9df6e52
change-id: 20260206-ath12k-fix-indention-bfeaa64b072c

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


