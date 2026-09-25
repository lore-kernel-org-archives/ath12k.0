Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64015C98325
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVpWonJbCGUCtyHw5W7lMG3ggcOqOkfVrR7xlm3pac8=; b=gTNs7yeDOjvU8kzaX7BFsPU7/y
	tPftj1VHbp22yX2aqcUkVkEQt+xo0vWb5WkcDFZ5EK114NOlkT0Q0XG6UL282NU7sPj0O/dH/q0do
	60ks6xlvT0esOPlSWJf3ST0G+hLE8THN8KRBXTPTOtlixt0ggLTjw9Y3vW9xP6ozqge/8QjrJHuFI
	CYfPnGNWTjLBW3ApQ+IePGV+B5mXJOAEIvJXnEDuvB8ezhPR5Pu5SIpCgDwOQ91zic0TORI+6J5f4
	6q6pjhhi0oxLLbI/8Ob/Qtly0Pie/UlYmDFg+c7cIdh7HKGqinlA2HlXer9p5EmdfsWu4Gcp/Y6dk
	mFS+ggzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pQ-0000000DmjQ-0MHU;
	Fri, 25 Sep 2026 15:27:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pM-0000000DmhH-3dM7
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:27:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PEKqZo600642
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVpWonJbCGUCtyHw5W7lMG3ggcOqOkfVrR7xlm3pac8=; b=f6453Ff1aZC40vNs
	VFScrSZuhcDl/ZZE7NguzvQw2I+AIiuQQ2yPW9L466oWXxZGBtfxzAanT8H/R5Gj
	RiexwdEADuwhn0EvCTOi3D2nRCgiB9ZqsNphCvE1hNIA+0uW++CWJWHi80GmpdeC
	fJqUzP0or26yFDpddqUiA9l3QekUFDvDVbd/YdaVFrZuf7z1jlqpshbKFNE8Fh/P
	Tjf4fUuBEZgsJc7OioRU3QIUVVsdYxrkoJPv/ACHn+hF+lC9BW9Ka9e5vHi0jw/w
	EJlrnnlz9LZMr+Gwhu40xLPGcwcmbtxNaYjwQi9QqTKVz2YDh5eV+R3Vpz+i1+XB
	4GF+Ag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsx4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:27:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0b6ef90fdso1019206a91.3
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350027; x=1790954827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVpWonJbCGUCtyHw5W7lMG3ggcOqOkfVrR7xlm3pac8=;
        b=IAqMKp5WokXCbp1uRUvD/+HJwzZdojusZ7/F5y3xotxPeCAaPTtEw8aPxiN2X/nMcK
         rrRtrclT9mJvUDwAdvistZIVuy1WbJmIjvr1bltJyXmQt6oEgrikad8i2Fhx2EKZVZMU
         oA5rLq+PzvkNkBAuUloCU2rcYAz9OsqtSO8Ef0GUCg7c8iRpPVncLIXXbM1jsAlJDJnv
         sxG0dCiUh5Rwsyx7WxsGjpY1BgSXoFYuRkS30zo0hHDk+yVrKp7f4IBUPNj8S8t65NJ3
         C4xt6VIE7hwfRqViOSWb3yvBbPEN1O7Te7Z97iD8I74ytwG2kNWFHrSBAe8Qzju8su8+
         4tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350027; x=1790954827;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVpWonJbCGUCtyHw5W7lMG3ggcOqOkfVrR7xlm3pac8=;
        b=D75w2fKBWKZu+T6gXW7j2eviAB6Y+Q/VPi6kBi1puojEnM2hok1x4Ui6QqjhVdMG1l
         TJE0F9v+JGrr/4zuxjqnfBzuQUVvxrzvagceD1hO0OMdXxoM9bMFVU2Hd+QMTBkMA9eD
         tmaHTaHbB7ATPaE3JBZ8ZPJ0SAtg0/I5B0maeprpCV1M+MWQWemnCfx7F2oQjQdTsoYA
         VmbcnhhlZ1mfQjtKNUzM4d2WJSCuIipbHV3jFYRFxcY6ZH1Mei8SrnNfSr8qtvYndKQN
         4EWyJ9yZu7PY+ewEvWnUIDc/tP9Fhxf/Vic3hL3QuzFlKwRm8QrvfF50sXz1d0LxXT1H
         wiaw==
X-Gm-Message-State: AFuF++mCEWkMuyq/S2u/sMgfV3W78FEXBhFSXfTCEUEtLIKAKoyRz3Ry
	X/+5PIUotpiI0ileSfb1UOIbhJbZFCHMmxbJvh7NaEe3g94TiLWIQQ68PWQZDhAKI4iDEgBNHg1
	Bq44MR5Jyatrs6unWAweCSGTY+2/56V42opvZLI18xeLhAhL0cL8qamoDa4g37QRe
X-Gm-Gg: AYBFou2XUQgBpaEHjeXLyZE215mJ1IXCS8+ZAePUZfRvqlIsFKyI7Dc8/muAncJR1P7
	xxgvCWundROEYryAVuAzpr4VEFl8Axg/Y7RZCMr/6FWOobBenqzB+YUIf+8qtVErcq+MV3iEIT2
	oWGY6muoxifV1CfoYC4vCUSddVdbxZP9p9BB6yVvhCCbXDAzdHMhu82+27NTHcPIteGRZdEe8qJ
	jWb+R8fh7xgg9WZrCWy9ebGH8R8R3Hl6V01RD8cjjYDDwpATpe20g29pMAmQOUoLBzaZe9cSXXp
	fVwp+LMHRfkOnEJPPK+w8SAVBySyn6Kl8ors4kk64uWKCZ6eublzR1TaLW8cuOu3Z9wpCrUdyPK
	s1evz+7iUts0agae+NhR9DdwoqBOlXp1I5i1xvSkePb6lil+3Rn7sUD4=
X-Received: by 2002:a17:90b:39c7:b0:3a0:d5dd:6093 with SMTP id 98e67ed59e1d1-3a0d5dd7046mr246669a91.53.1790350021277;
        Fri, 25 Sep 2026 08:27:01 -0700 (PDT)
X-Received: by 2002:a17:90b:39c7:b0:3a0:d5dd:6093 with SMTP id 98e67ed59e1d1-3a0d5dd7046mr246651a91.53.1790350020692;
        Fri, 25 Sep 2026 08:27:00 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v4 0/8] wifi: ath12k: extend device DP stats
 for TX and RX observability
Message-Id: <179035001887.3875741.5463308542532617988.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: aGgAZUhHRF24qTqGY4gvL4LpoDbroto-
X-Proofpoint-ORIG-GUID: aGgAZUhHRF24qTqGY4gvL4LpoDbroto-
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab692cb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=a-3tiwmhLL6f-xxmbPIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX2nVvbv9bBcag
 L2qMZ34gPrYLtEYDC5/M/Ac7ease90K8B+XU4ZP1RyQb6lgDU+4sCm0EMOUVe+EzqoI9RekgH8V
 RtxhCh5KRALCKNrKzOaM2aJW2B8s7+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX67ejsBtKpPEE
 SeEkO5JKCZi4TdbBt3FYPSstt6f87oIMonLiYxE5eUWYqpvET7Q9dknXscfmtjN685KT2Ya3gSX
 OvQDXuSFoLuVFBjTCa/u2HNSdXIntRStwCX9IkV7qD0tLECmrG/LH3vRBTMIf2fFpBW8xdtZy+G
 8S0horHEQv/J+IJR8i+C4Dao8wvpAZ6p3WtT38HBoSydNDoVmp3ZekwCAMS4CwaiII7Z8Td/tyL
 +tK2jsnky+FYt2gHfJ/g50EeInLSMm1rOBoZNGxOO4rK1iFvUnCt1YtXh9hi9eM+vRlTfjj3Uyn
 MTLLwa+QQfk87uFF2umHS68CHI8x+zbBeNzmweZgIvkEQDgwB6CQ7YvfxAOX9DdD17xSt6t9PcH
 njAzqpf01s04VsJDvCUeRqwurkwJXDF1vUGT1C3UbFfck1gqX8yq7OuKUKnnjRWbhcqYujse9Jd
 LIsQJxGCYpJ4hEMcKPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_082709_032141_4E62FEB4 
X-CRM114-Status: UNSURE (   9.67  )
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


On Wed, 19 Aug 2026 11:02:39 +0530, Pardeep Kaur wrote:
> From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> 
> Extend ath12k device DP stats for TX and RX path observability.
> 
> Patch 1 fixes out-of-bounds array access on TX stats arrays
> fw_tx_status[], tx_wbm_rel_source[] and tqm_rel_reason[] by adding
> likely() bounds checks before each increment. The default: case of the
> switch statement that follows already handles unknown values with
> ath12k_warn(), so no WARN_ON_ONCE is added for fw_tx_status to avoid
> double-warning on an out-of-range htt_status value.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: fix out-of-bounds access on TX stats arrays
      commit: c8f83d3389d1d1b318ac3bd2ae3d60c2862c90b4
[2/8] wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
      commit: 90396f4a01fe2e14c2a31540a73fde4c7c1cc8d5
[3/8] wifi: ath12k: add TCL ring TX buffer allocation failure counter
      commit: 6fec999446d926e1f5d2c0efc306134f64f29686
[4/8] wifi: ath12k: add device DP stats reset support via debugfs
      commit: 26e095b0801ab6d24cf20b37eb377bae3ff39715
[5/8] wifi: ath12k: add WBM RX error drop statistics
      commit: 0f4f1fe45e4b49311e9cd0fffdd3290f57b5afe1
[6/8] wifi: ath12k: track per-ring RX sent-to-stack count
      commit: 7acba3c0a67cbe65d9bca8437e01065e778ebf8c
[7/8] wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output
      commit: 640240adbde5ecbbbc5afab5d72d89d7dd68347f
[8/8] wifi: ath12k: add WBM SW desc fallback counter
      commit: 8637c54300cf71fb7e0f8f402b4393e0b73d0a11

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


