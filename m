Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F12F53D65
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orItFT0VanSbWworpG3j7AcsBcqCgT07fq6tPteihX4=; b=Aa9WYtSmldV9HKI+Z8QZoeJCNd
	OR7MvHgS2ZyuZ7MUWJQwuM82dNPKc18dCBT09PVJDgyIXXvt1cs3Oi9eYCESqTE8dFtqp5tjs2Y7I
	HET3EWfmp0Rl0DRLN/AjgebNHWtfTMVgi6ej5GQilW7oJG9K4b45lAqlGw5so1AuSUW+4/v7F6JIb
	Uch1WNI1PVDGDDaQ6B19+ec/aKkTmzjLALn6cEwUT4uKiOVa0CUe/UcCCzxnmKfS4Py8a4tBgjs23
	w3w2CJLyZ3Z7wsZaS+wL2K/YrpY7vd8P1T4uMPzUs4KRdeW3Lbt0pdV3nDl2aa2jv1UCDtsoXhnN7
	BClnFt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A0y-00000004LyA-32EC;
	Mon, 16 Mar 2026 15:37:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A0w-00000004Lx5-37FI
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 15:37:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBisFX2672139
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 15:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orItFT0VanSbWworpG3j7AcsBcqCgT07fq6tPteihX4=; b=KZznSQ+AXxSjugau
	FgklzUV8L8fB/jmXzK8m8sIs8dd0ibBI5mdW/u4lT0qONkPAcelkYUoGKtfrkiTM
	1DG8A7dl+xexYumhHO1n9XHjy2jtnKhVhlsLIODLEmaPbpLxbHwH6KVxtNw65dhF
	sP3A4JgnnVSwGY4Ma1E/3+SVbFH3XoVGy/8eHpyWYS9rZrQDpRtiM9RIoe3+fg/8
	AqMAp78m2bPMZyLNOxvQEwq08uivgoDTmbjUM2C773BYnMtta1wzPH6RHYSD8cgm
	RDxiTv5NCyLvPVXSaFo9ViKjiItszD8KV18SkXNJM4fbC5mixl7dvnjHOvj7AyRC
	9JChpg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xpfaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 15:37:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0b98848b3so883002eec.1
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773675472; x=1774280272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orItFT0VanSbWworpG3j7AcsBcqCgT07fq6tPteihX4=;
        b=JwXR64BOBTErf7w7mikBNkPFRFw/VFFDFKCYClH/gI5v9i055Gm5pa7I5dyJxBF+yj
         4/cWnHPE7t4LZFWjU5EbftylzJel70oRLDbR/U2k9WiNFvR9b2z5AEjAJKA22Y6A2WXN
         h8rUgnwvE7u3v9XOcverIkjUFvn4I2QaJHr4bUhZj0q/GmRG2nUkaHMtW7f/9YaTpzLW
         +J9W+2yR+GV7dcTLIZTEZIeeZokgBeAu9wLztEFy0t9h/BQtEOu1wfmDWscqvEnmVKVI
         h5Ge3w6XS2pQNTlFYgYBdhu5CGczg+N83sY/mWGqxyeb6ScGgxLtrXuNSm6HclI0JIZx
         XOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675472; x=1774280272;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=orItFT0VanSbWworpG3j7AcsBcqCgT07fq6tPteihX4=;
        b=Y0UD7+TywJEsvSWdlxdNus9y6HBQYBGvwXooORoG+Md9zd7EIO6XekITkynEjCVXRm
         OPuQ/7J+uuM8Dcsf7R9yTY4oRnfzG2pLr38zn+Ptc4DNXB0dadkWsJotsGIVZDsKqQa/
         vjb369bINEBpqGSqhk7sDB+l2S3Pma/7Kf/GN0KAj3aZID9Kto+1iRI4jKFKDmFu0I31
         86rpkNStq77laGUIwHgpUuWiz79ezj2wr0Lxf6/51oEPsRZPcLAyR7R4pqYu1tI/ahFE
         G8QMr/LcC1PLFO6CGwyXTs3y4B85bX4nBHvjV9ktmibXod3i1q3r7wnbkWnVZibLcNGR
         6WPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm4UnREG3c484TW2nnHywTGpYlrim5IhW6Kss3S9CkqCyfqpkvDC2vEZ0eRrGQ2iTSEbMpyLg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoqwsqdBighfMC55K8/3ylt27mXGwyflAbjnhI00Qs+lweLE1s
	PP93RkaymqQrNJFimMRMWS11JO+zxvQZhhojDDRV5Bek575/ThUiwfsaJet6HriEdhbZKlm/jPx
	7oLsSnDUmUv4aiUFCBk6u/C77CyMhoikIKk3pWGCTGTxGNDjNCyz57SisekVG2ujt
X-Gm-Gg: ATEYQzzub/YVdfqPoQs/eghpjvBnIgAWOrfITrb9GYCBI3w0JZ2AFcYEneEOjxnSLCd
	meqGSp9HtHdYtaFk/WV2afB8PTz2gETDXbES5DPlv7xsvOEZn9OT6RHdjajpgTI7Xyp/Jtx4EHS
	zPSoQBZYAdYuAWzoL1HEzu8lmf0rquKz0TZwlMqn85USRqwK+1lUymTIBoRQu2CI22vtknqz4Yw
	9/c81c2NBgh7ea1wzD6WIHr1bZu0lJA9bu/TBrQ+Jcvo/aIVvx/GIkMzrJFosoweYfENx7eovsu
	MIfh/LvGhCPOenARDsgep5gQpQJEMRuu1mp8OCdrPBfEY6T/WfkCnW47q5yOBlEeF9KFXxsUIQM
	vSxafFlKAXCrOhKUdc7HvyDeb3Y1bqgzgNoWC4SNAlKukwK2v4pwugqpbjiGx20Hrk2qKyAblkI
	XP
X-Received: by 2002:a05:7301:290e:b0:2be:79a:69ef with SMTP id 5a478bee46e88-2bea54eed35mr5930937eec.20.1773675471894;
        Mon, 16 Mar 2026 08:37:51 -0700 (PDT)
X-Received: by 2002:a05:7301:290e:b0:2be:79a:69ef with SMTP id 5a478bee46e88-2bea54eed35mr5930924eec.20.1773675471215;
        Mon, 16 Mar 2026 08:37:51 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab5706bdsm17695739eec.28.2026.03.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:37:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
References: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Clean up the WMI Unit Test
 functionality
Message-Id: <177367547024.3157544.3506464317798328713.b4-ty@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 08:37:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExOCBTYWx0ZWRfX3w9PCnRpvBpk
 AXEV85x+3j1YeFoIUHappejfdwxWTlEYdKktODb33kj6LwXwJ8TN/9bdvhdYkHIdTBNFYoNFAcO
 EBtPjJbWgzU9ZZqZRsaNxPkLnQwlsAYBgSbj/TOs8JCzISvWERujK4ManHfNh4Q+kRZng2Qrcof
 T5rn+35ic8kvz70V00XeMRH++bCq57Nlgl0xup0V7MZiEIcT3O6gGMhWMe11fSizQNElcXMlOom
 xb05iaJnaB0trFzXiK16FRP6jX+ObO7SbScEAShU2zTOccyzqoTN+EdPqrJsa6/sE6qWm33I/y2
 iY7LzYgE4m5My6dghlh3nYfyXlux9Qs/EmpW7XN5m/bij+FxN2XG05/p+i6sL2/vnFhp7VKxFcn
 3IMIoeCZzNmAabrckZUhqyzvSzF4fubdFWZY+JacxjytF9/PigUaHOJHZPzOedZ8NQWPotXWtNZ
 RXquou92cRm+DCt/pyg==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b823d1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dOMWL1FOFzDKkvFCTc4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: cBY1cfmDqyXVUshieSh-Cu5FeTSRpXWF
X-Proofpoint-GUID: cBY1cfmDqyXVUshieSh-Cu5FeTSRpXWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_083755_007007_00FD3881 
X-CRM114-Status: UNSURE (   7.19  )
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


On Tue, 10 Mar 2026 08:16:11 -0700, Jeff Johnson wrote:
> Patch 1 updates the core Unit Test functionality to address multiple
> existing issues, and patch 2 removes unused DFS Unit Test definitions.
> 

Applied, thanks!

[1/2] wifi: ath12k: Clean up the WMI Unit Test command interface
      commit: e570593b568f74b8d8367d094400d71bc398118f
[2/2] wifi: ath12k: Remove unused DFS Unit Test definitions
      commit: 7bbb578fc43e7dcb8690cfc98844bd67bc311e8a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


