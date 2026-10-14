Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BF8CC6B1A
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48UTdyStSoWwcRatCEHEW09klzZq2SDB4NjKSce2Axg=; b=S8iQpZSVWgVGossx0AWmxjQPb4
	A6ipWVt94TwOiB/ufjaVAJsLZ5j27HHOeLAWkmGVKKrvohN9c8WD54roH92/OKqhIaoLR8vAUW/tt
	1jcHoh/n0YfrJitxzYJDQOlO3p1tNJvqcPjB1f/7vqvV2hnzkqvC7D7jxic48voG1olrWD2Jdq0jB
	Zlco7G1mMuD7D+PHAbAMUr21tl3eaFnwP8xVXM1MrE7Kgx9CjmzWix+CyrlK73d+rdabAXoW/Xif5
	UwaftH+uhx6W7rF9Q/RHyAOSzKWCgyokd/0FJ6Q7E+soifoTxbhzmS09oDq3TtAGXva5JgQhQY1v+
	8czMw1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH07w-0000000FkK5-0nPg;
	Wed, 14 Oct 2026 14:38:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH07u-0000000FkJf-1gd5
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 14:38:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEcb7A3209612
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=48UTdyStSoWwcRatCEHEW0
	9klzZq2SDB4NjKSce2Axg=; b=l1xBmcj5C5zVpisYBWLNQMbsiKVFop+935YX5e
	jTbhQ75Ueup5jc9dhGKaziuw8G+HNgZPS8CH8nWUkknbbZJaEdHdJTU2aBYKHB+5
	yZdHG9CtJLGmxnmhHkRlj+ransYhnGLt/JWIY0WBKNgxjb0Qni7lMKRE8hTpOuTp
	6zfT8ursxBVPRx4rpbYLJ0eyM1CAmHN0B/kLFPwQ9IoRwyBzf7xYvB8RQiwelfre
	LZuDFtBCRjFmPTJxwivV9MXnqNRFPiZ2ssNmIpUMypNI24kO6xUCQC1HLBWp1hb3
	Ovx9pmcGugxxSEj1qXia0JMeb069+LDxugOUCz+1kP4mMZFg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6by5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:38:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179a556c43so87445546d6.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988668; x=1792593468; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=48UTdyStSoWwcRatCEHEW09klzZq2SDB4NjKSce2Axg=;
        b=Tui+sjeyf8i4MuW69zHBcel9Ov0yIqNfoaRSTHbNV1DkD8lM5hk26GBDKuoWIRv8V9
         rXv9Q6Go6wOhb/ZDuCfEZCq21zL53nPe3/OUkr6CqMEQhRlHI60gtzzWBPlueTKFasxK
         j9ncrVq4NXXXOOq062qMvZsvFvKW1g5cU993XuW5bXj0/S6NBQS0b2+3ucv0JTzwVrsK
         fGuLszMJKXQYy4x6OW2Lr67jWBEAt6by9Bc6Vdlvg/ulsJ+pDS4XRrW81idkFeX299et
         vffxp55xAeJ1pXjfiszZ6w+lPMG5N118ly+J8shUMBce4v+le2BZxk2RHSAvvltCdW/f
         nkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988668; x=1792593468;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=48UTdyStSoWwcRatCEHEW09klzZq2SDB4NjKSce2Axg=;
        b=0UJAqklQU+FT0Jo9vKxSeVHLNj4M3vCaX+nJ/aYqvt6WcOmt5usK9/RzqHCDmEN48r
         r4l8OyXkPnT6yPdSnk7KDEuVZl0fOyoZa8aHHOH3Mg23zQSbI1feCMDDiAay8xd786mt
         dt6UNZ3gl94GxR7ru8FwcogqMH6P3avPy1P7vDHfH6vgEPk6Ujn3AUtGQ9KtW5p5wYt5
         TW2wbSoN0CSfW3pnsS8KA64Rrg40CnDdP4BXYqb7hRwqbeRtpRURkaghHZy5JCEwFVZw
         suUSLcntYrW1neiStDqUc3VymFfZcvIbeN1ax+zDUkyWh1/PWpiALTPmvDAVbpbThmpY
         yerA==
X-Forwarded-Encrypted: i=1; AKwUvBxImU6RIbNYgn2epx6QBQbLQIxV46CC9zav7Wx/6aFjnoXFHWMggt3MbQBUpv8SvwouKuRFBG8=@lists.infradead.org
X-Gm-Message-State: AFq9FYLo1Wd2TZy2CyvWZGu4oIYCgXmo1vsnQyGA+7otjJouUZ/XOQLx
	EXg59kY3Iy8BJO+jiFgBhYpTMf65IH93yVeVK2jZC9EJ37WykWhDMSROcZGY3vFCdBzMa3c84sk
	57KEPtIAMQij/Gk7DGo62n2sWUcSJOXwfo4bRxbNmAwxpgR2A5FgBjSwqUyzUfA/x7897LHFV
X-Gm-Gg: AYBFou2W2iFPIUnVjUQ67Jo94xskF7fWipEatAdVXAD6vR9jukSoyeQK6BWEE5O0JZQ
	QZTjBQTLNRdIY2Cjln4PhLNpqyQFexXGuJsBlDIF2nOZmUVtUf1kDYL8K08OLnblwcJghyeJgv0
	saN2qsLj5nR9NsyolCIJ/olcMw7BztGNb+Xbk1H60N4oNakEYoVLYkQS1/splXklUkJbHDyYel9
	5Tem+IUEGNAkj33IKquEyxfxqL6OCjNK7lW20qcTL7IUCRsvAj33848rPg6bXdzwrFtdr/beXMV
	XoDdJFwE2XzNwj4c+Df7N3/pDs1L0bwhlsVPAKRAwKAR7duVKx1kk+UwD2X3Ti+swnrPf6YK6a2
	k1vdRcplY07/TLQ==
X-Received: by 2002:a05:620a:7106:b0:93c:7e9c:3bba with SMTP id af79cd13be357-93ebd24c5c9mr2608256385a.41.1791988668281;
        Wed, 14 Oct 2026 07:37:48 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:93c:7e9c:3bba with SMTP id af79cd13be357-93ebd24c5c9mr2608251685a.41.1791988667589;
        Wed, 14 Oct 2026 07:37:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf0d60esm5479325e9.0.2026.10.14.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:37:46 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:37:11 +0200
Subject: [PATCH ath-next] wifi: ath12k: fix datapath lookup in
 ath12k_wifi7_dp_rx_process_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-ath12k_wifi7_dp_rx_process_err-fix-lookup-v1-1-4670f8f98589@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NWwrDIBAArxL2uwsqwT6uUoqIbpolRWVNWiHk7
 pF+DgMzO1QSpgqPYQehL1fOqYO+DBBmn96EHDuDUcZqpUf066zN4n488dXF4qS5IjlQrY5EcOK
 Gn5yXrWDU3pC6kQ13C71XhLr9v57QM5iorfA6jhMTWI56hQAAAA==
X-Change-ID: 20261014-ath12k_wifi7_dp_rx_process_err-fix-lookup-d1a2e08e6c96
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: oRVLtJ54asYFeQytECjicJVwrh2xcgSR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfXzTxOY1JPsFDV
 ZxF42e9lJkCFS7uV2iIeV0l+C3aEKzOfSQq9GDcdDdIzKeFSU2T21tUDJ6NwsQKgGYmeWsLIJ+y
 7Mq/VWrNYbpsxwoL4p9K7dups6W7vVA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX0RSrDU7jbd+f
 1iwZJJKr+vnEwSeBvd/wilyuNrqrZwU4cfRTcB4ZR4j5n3Z4Pm9ACFIzS8io39sDZufFsQIcJHa
 /FkVL2hT1Bysrjts4I2ClufNTx/hwEVqjrJYNJZPNfeli01y6F/RaA4sRpC3RlEz+jpF6nh+PFG
 cOuAnzot8sKFjpA04Y+TtzudhdvJAJhvcMr/xWO/+y+VFBzqcdRY4Ew7ISplby0upK/rjDZDl+J
 d3Lr1U40VmbmiRe7F/UnuiNf+bAts8OldrVj3UxebbSHyg9iF5CGXuBzgt6ZtqwWtGXWtYAAZDE
 qLkJR5mM6KXPgrOY60YcLw4sz3QBe6Lj7Z8VVJPrmJwoPkDiYT7kQn7bdZRINemxjSy+IDKYuYW
 cBWpsqB3irzKxCCxQSrlolS9yraOPgneJNOHFoIuFyBM5MVHBsoe2aGFE1l61A0+fijO4uCdPQM
 4YUmTxiKPklQ4NrmPpA==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf93ed cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Vw7K-8P2kW1omTLmlekA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: oRVLtJ54asYFeQytECjicJVwrh2xcgSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_073842_449804_D82AC1CC 
X-CRM114-Status: GOOD (  13.84  )
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

ath12k_wifi7_dp_rx_process_err() resolves the per-pdev datapath with
ath12k_dp_to_pdev_dp(dp, pdev_idx), using the local 'dp', while
'pdev_idx' is computed from the owning 'partner_dp'. As dp_pdevs[] is
indexed per ath12k_dp, this picks the wrong pdev when the REO exception
descriptor was sourced by a partner device in a multi-device group.

The error is currently masked by the drop condition that only processes
same-device fragments (partner_dp->device_id == dp->device_id), but it
is still incorrect and would misbehave as soon as that restriction is
relaxed. For this reason do not add a specific 'Fixes' tag to backport
the patch.

Look the pdev datapath up from partner_dp, as already done in the other
Rx processing paths.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..633cb91b9e5d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1536,7 +1536,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 
 		rcu_read_lock();
 
-		dp_pdev = ath12k_dp_to_pdev_dp(dp, pdev_idx);
+		dp_pdev = ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
 		if (!dp_pdev) {
 			rcu_read_unlock();
 			continue;

---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261014-ath12k_wifi7_dp_rx_process_err-fix-lookup-d1a2e08e6c96

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


