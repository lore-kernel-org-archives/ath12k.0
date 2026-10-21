Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F094C606A328
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r/qYNNcf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9kKQk30;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUFUofvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=; b=r/qYNNcflsZwlIPolvraUlpBcD
	evYf70GGwsWlpkIHMnIvFTK9bjwX+H/6cVY0/CTPHgrSa520a8h6RPHvbOsbU1rrP2TtByULDiCbh
	SGOAD+QoBink+C/pyOs+B4MG64lm0gW4nf5r7sQMeFMqAmf6qGsDn2+PT4X5TxeNcLT53f4HFauY1
	wsVMiEJ2pjX9aq98t7w2y1hqDMgXOxEiNM9U8+77h2W4HjPMS7sLUV4wbBBX4NR1FUvSoyVvg1pqj
	5yKhO9c82fJTSnPalc7CXc3SMicHG24VaUfXN3MbxDU4fifRmUfg7+C7HZOe8WmXao+ruTSOukYod
	PuTnEhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZCp-0000000CQ1A-2oO7;
	Wed, 21 Oct 2026 16:30:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZCn-0000000CQ0Q-3Bmn
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 16:30:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFoFlS524244
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 16:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tlGZKGlDFlSxsOTfMCF1bM
	EShPw4Brtj/kvvPvd5sbU=; b=k9kKQk30PUdLl8ArJ8roU9rVGZsUL1RO7QsJ6g
	ibh9aMHMuoBPsgbxArYJ27WZ9Lqa7wCmj5wPMERpZGXfdC6IUW/NWKFO17jieEz5
	sI0n6UQfSz9gN0jsOwLkNk8za2ylYUkFD3CCu8grAojXmaAmK3TgUZ1/QUZNLoOL
	vP6euYLIeP+f3mNiN4oDMxJiEvkOgq49Uz1jQ86ScJLBXifSDnpJZXJ7ZvlpXLFD
	3KDt6Hw8Ckg+rOpOn6KqBV8+Rnbr7K2rws0Ga73hVFuRiboaMVf0UNgySz/LUf0h
	YFb4WvFf6KFfLhEOnKTbiKb9+Pi/O2aiJEa9Tp2Vc6KJVnkw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv06hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 16:30:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso27909a91.1
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792600220; x=1793205020; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=DUFUofvrtiNlXYfo61cEbOiwLhx54WLe7MJqrzwDV4pMBClVFVKfu2WDHSJ1vzfsXE
         W6i6sbo1Uun3L5iDgXBiosmNL2r/MFeMFSFMuJh2Ti0sszo35blO+Xk4uIa1BiMF5S8t
         Jqia/kQN95hetLyGtmEqhtfJdQSTPAMvPZqzwa+XNSmzuwFXDpP334cH5zQfoFwzk9lA
         6LAgYlshzsuS9sxoWMRiExBYORCk3DCtea/iToVOncUTpAFKTZvauVHMNZZLITSgdeh5
         /AutezUivtnIQrXehes2D2Ui4MWGFxuFPL1qR6yFvWwzeSJ53DERYiFiFl0SB3Al1wFH
         9B6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600220; x=1793205020;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=xGIPkBj5oTGhU4xArP6iqhelKzFeOj2lmYAoLWi/BHzYoDMc5grz+11c3ju106LJws
         tcbAGp/swE/09CqtXPP7J4V7dPieulIhtAg6XLfyBAS2Q/y7nIi+Q166lkb205MJfip2
         ABv+qpZOwGcIghvdZ+bXiVQvM2Ft8l932tsZZ1GsfgxJH7TnDmlhnXLs/PzhnWV8Vq8w
         iUV0mPs0TAUEYyytQWpjcPrBbz/GSmsfzdVICghPfH1F45iidjSVlxVttntCFMz9f6wN
         1hKf+7DIH859+8WkAoT+s8HbKc50HuwlwxuJ0n4EEF+b4U1fQCRydqHWuhMIkocvNuxg
         raAg==
X-Forwarded-Encrypted: i=1; AKwUvBzp3dK7t65YazZ9LeM2Ci1mgZ7nHxS2esw+aKbN2MBFxNnlnE2izSWrrJZ8IWR5oQuwPA6BwHY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKS9oOnLGSC88Gbl3YXbv8mu6ceGmALwfbhhbHPHJJiMuRtWJ8n
	UbSAvFUowyWLWv7pR4pnjmb/1bzbcvthqG32BSqkMuyLY0NnxQNjRUuJ1WmL7SwMEkvJuce6HS5
	asHyPGxiX2RS9m8QHhQ+rLNzMqIvh86GYFdyodeHrIsQEpQFfYKNmjIUGhA3K5a0+
X-Gm-Gg: AYBFou3xgUncL27BDek4UasNx0bRu1EqVr8LWa7ikPBQi4WARSbWytaFKytPp+oH4y3
	5w/VZpvuNMTIHXNELtBualPPbXHLEiUOWJwmaAuHYGfU7aVSNekNFI+1LHOipvqof44BeIrhV1E
	lj15ATL8/RrVvJrYXVyznaSXoYF1A8Iapm4JrATC1V02CadSmTsIRZEydznYaF1ORtp2SYgREsd
	M8lHRQmLkn/NYYIMTI8S4jyScotdyYshlfin1IFeGpMNTI47XxEnyUjLwSIgMJPWFTJOEgmkQ4W
	F9jjnKBwdprESs6qy47V+1luWOHCyrTL3wz1IKoogvwx4YHKQUsBQC72YDnAve1zTGm0MbFCEHo
	UmcPvi26fM6EKOIw7LHTueF9gmDIiVrh+VI5H
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499981a91.3.1792600219339;
        Wed, 21 Oct 2026 09:30:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499969a91.3.1792600218678;
        Wed, 21 Oct 2026 09:30:18 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm157338a91.17.2026.10.21.09.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:30:17 -0700 (PDT)
Message-ID: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:30:17 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261021
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad8e89c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4XpVXbnAYeqWjhfzesYRRDgIzUv-9raM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX8IH+vg5FN6Vy
 m1bN4068cS2jaTTalJJmJ9JlVXd2hedRO+7xKmZUHSfStH0FkXH5dKkiGrIqPH9ptd9EeYxjm0R
 OQ1yDxNQWwy3dluJl44JrZhk7pCa9Pk=
X-Proofpoint-GUID: 4XpVXbnAYeqWjhfzesYRRDgIzUv-9raM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfXyZHG7P4EOoNc
 xbKf+Beo1VksJiIvzoGJ5FFo9tx0JzTylLjoN3Zljk5H3VNMOYf8cz8sJCKh5NGmAze2PBwYHT3
 dRC3Wf2nHNGAlihnoJFrsU7hdIcw4h4jwogRqSN1dCWObHuQ1BygODBJX/mAWO4fnU8x3OAIDmM
 vkgEcg/smTCnK82VGY2BS1csgDYm+TugrN15151O21Ay9zUf20liA/ssdpZDE7WkUgHssH9ucD7
 XjeJrT7dGjj136oDfZFPTLIgqEM8dvbXSFLcxhnmncrCNaFR3qr+aieO87IIsdC0umu+79K7h4K
 QkIYM14hIoIzvI3yBjOvx7PbY/0wPTqjUEsWL1FskYZUGdgk08PALiAfWkH7UIS64La+WeoLxN5
 VvFVsUgNE5lDS587hqxBPTiKKbabi7cqNJBQUjxpp9XMtmSjJKQImTvGgD3bSh3Oda5V4tSxwc/
 pc/U728ipRR2yGXeorQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093021_809212_F5332327 
X-CRM114-Status: UNSURE (   9.87  )
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
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.

For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 59f9fc2ef8d1e312d2a613d4e1ffad2ff31a0a01:

  Merge branch 'qcom-fw-version-qca-path' into 'main' (2026-10-21 14:46:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261021

for you to fetch changes up to 0c5fbfd280e21e243f5956a0823cdf958839ebe3:

  ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226 (2026-10-21 09:16:32 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226

 WHENCE                                   |   2 +-
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn | Bin 3811820 -> 3808072 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

