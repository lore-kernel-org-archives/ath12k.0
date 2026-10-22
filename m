Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BBB606A319
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 17:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbTBz6WJ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jBxbkPjm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=am3lgEmc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=; b=wbTBz6WJKOwcxtgrnRam+lGPkU
	BTtw6MaOKElvDBp7U/LqKYn5lesVyTzp50Ysqhuo5PfIaTt3KcSj8H9pR7J4R3DC9c7BygzdJWGSy
	JmpW/UkL4Z0HGIobgJrro96aXvL9R35RtNEhe3C0ydJVYSL7YFooCXUQeQiNZj2B0vXUN/K7wPJbO
	lyAHCEUabHsKw8lR7Zv+1LAnoHGk06HSwEldr2Lj2f00MOVzmsUTK8zCG+HMxt2sfqtUExgokzs3f
	Art0LIHkoN0Z06UjdhQvuG1/2Z53vCfm/aZAoe82FsiCDWgNK1EeCNFRXmyno9lsafv9wUE73qQm/
	hSnYLhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwvp-0000000EdsV-1UxJ;
	Thu, 22 Oct 2026 17:50:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwvl-0000000Edqi-2BSr
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 17:50:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MFme5H655581
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 17:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gugNWHoGVfRUDNY8Vu+7gr
	h/eYK/jhHtdCQenYRhq5A=; b=jBxbkPjmSWBgZFfe9z5p4TTSrX7oxGJ8YxEtpx
	U3+FwdYuMh/PmrSH9Plo6+C+IUDdbJJTIeHlCcxc+U+XSk86ggHymLs5oKbyModJ
	yMikKvui/bkVVD9NNBWiozG7Hjn3yXPiUCUXIR3/HdUe7Ne+P2MvB43+79+UaFDL
	FA8CT1g5GPy/ofhuM3J23uY1k8tBVnB6TO3eAuPh/RQcV0JDPkAtXKgHAJhazYg4
	EEO0AD6Wtjt0g2db3ePVHiVY+GT+PwplxrTwZuGWUozikth5H142Av1KGPgf7mW2
	6vzqwj1dq7SJSwdcGG2fo8+LQt6M/ul0Y45UQZNie8dKyVSw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cd0d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 17:50:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso31012c88.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792691419; x=1793296219; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=;
        b=am3lgEmcinGGtApeob89PDtcWukI6/HJXfEMtOl875of06QpE01dHRy0xj6JhbOamH
         knoSqyWNieQvuWCeZZsZrpNPb31nL2Tm9UViFgC2O8S8ZsWZEPvPRjynAUd4NoiUZDHI
         XuFb6ajQ5Dvrk7/sQVwyDPgFkrCGNAbxAq7+c/KededU8H4hpdsowOZ5O7MMsjzG7ML7
         +oBYl7OMa4Qp8xCxiMBDJsU26qyEHAsvSmY8B6PJkhlKLfAYCrb0KV41/8jkACz8UEIG
         EcQYP2UEIN3Ve69O+o8/vkXHQCqOWaZ9H/IEnsEDfipKyUIPcUJmulqu45lO3xaU8pt+
         /FnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691419; x=1793296219;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=;
        b=XnW8PMPSgcBWMGXCIk68JCFpLcYaPWsqnflFp6EWgfj1ux6UfgGnCD3XQCGNnSoGxu
         o2/40LD/kB1KezjA4D/HMxf7w4OXeLiJJdTSGL4DowhzCnnHUZOmycYrrmsNLvhZr20l
         PIwwBrz+fG8wcoJ/6MrM0daRgSLJSmA4y3JyluI09bqdn+/mLY8XBx6oa0gdgSFMxItF
         Bj9xztPy2qhgCO8wYOlkDuyjrzsGDiEJnU+CSfock5F+KF0xagXfHg6v2/JrNEbdtJJm
         22UlcdqQAS+SbYqcrVANnlzNv5YteV8aWXZuRtQTE74cBn7BGJMT9xUvIPcfoL7vt1OS
         RUkg==
X-Forwarded-Encrypted: i=1; AKwUvBxeSWF+V2y4L9zEu1kcswY4N96cQZC8QFh9gNJ8T6Oym/97LG0CPA1B/rIXxL3AlZ/EfElZAIQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLrZlzy78b3RYqZ5tWDy0WrEZMcfq/NkcxVrJ58gc7Io3zuaxk7
	TOdd8uK0uNSDh6rhUNF73+8wHSSnIsJOf8gN2AHqo6YpMJZFGxynaajv8xj86h1ZtQBAoFJmOnG
	/Gey1OtHsVpuLeyLsPCTZ1PJFV3PCUt+KRGLQ0HETzSm3Gno1bedUG+z7BhoUj3vN
X-Gm-Gg: AYBFou0onh2moUQSnc6qhhOTz4Cc/TxvMBZEiHm7nJv4eI+mEwdZlFFbpywyUI2jav1
	TF61gI2SpqDIjd4MowxUIE0MdiAhL/6R5yk49U8VjNdxvHInT0JU7HPAbagQpjXszNaGg8xnWYu
	1QCGxFHP+TczFgzV1bK6mobh+zYOueQcUFszaEvHrJ7p7bA0ws5Mi5WllWtp5n92cT+HOJGLM2Z
	joLQyO7kFD68t/00MGU9+iZI7ZovqOWOkkRRdZoeULV0RblwnyJG+cwX5i/K1Y8AENl25Werw8F
	NCmd/6g1wTWb+G/s1Mdyjce2xd+4oEDhO78eBvxuyOoMxp4AkckUxTpYaRIH+i0qxoNEWv5A/VJ
	a4f7qTNaKyB1ceb27eGvXYoJpbw/GRcTibqvq
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr9771927c88.7.1792691418553;
        Thu, 22 Oct 2026 10:50:18 -0700 (PDT)
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr9771872c88.7.1792691417718;
        Thu, 22 Oct 2026 10:50:17 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195a7f440e4sm140975c88.7.2026.10.22.10.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:50:17 -0700 (PDT)
Message-ID: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:50:15 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261022
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfXxNnPuIRDLwEd
 WdLKJxWRNCxLJRWFVvBO7LugaCyzCnv5iCPRVW0qfungvNq8I8sjnIQ/+E25yv+DrsELtNDIEnr
 2PVon2hhBjOZwqKMTuIsQt5N84061XA=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada4cdb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=wC-Lp9yRyfpcNyighFwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Xq4seGhMkatBjpcswEk1Xa0BvKV80B5g
X-Proofpoint-ORIG-GUID: Xq4seGhMkatBjpcswEk1Xa0BvKV80B5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX+GTN/lpMCG6h
 pQO2qlU9QPiiucJP0JZ8DY04YquTtAe22kc0h1xRWDbCaqRdW7IqUN4ne2UCDuM+65ZLzO1jAix
 afiUdRMrCAt7B20h3TRaTBCquCzZREeBbfUX8oXfYFmR3Ob1h5CqJfQnBgc9ot4+SWCn/mHuvHL
 WDlhwW24bxWe1DQmBH+lZkytm1Ul2Qb5yXCfk/I04iXjCub1kweSQOWMtBLcUZ/GfAdPX/Oh2Kw
 B7oeDycT0phMo0nNTbS3KFrD0kJhDb9hxVbN0oIoVVtaRedBCxvvgZyJQ+064ftyy2cyziWiQ+b
 iapg4tQzV/O4jVe4wNvXOEn1JrhciSLev+5pXnOaVKXrhKXcrlMP8sBbOeKsJ9UX0W7PX+oSRd+
 P1lACTe5or2obpo7AKGg1kPFuqDz8aj1Qbf8+JYmEtI6Xz19I5snRnJ24Zzew95YMMD1WEd6jqs
 zo0DBweV1gf8TKGFhvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105021_709274_4AE2637A 
X-CRM114-Status: GOOD (  10.11  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's an updated pull request for ath10k, ath11k and ath12k firmware.
This supersedes the request for ath-20261021.

There are no changes for ath11k or ath12k.

For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 00b1df13f9d0adebcb90bd110a4a22de5115e077:

  Merge branch 'main' into 'main' (2026-10-22 09:39:18 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261022

for you to fetch changes up to 72f3b81c89fbc52677b9dbbfa92cde0ae00a36e2:

  ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226 (2026-10-22 10:45:11 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226

 WHENCE                                   |   2 +-
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn | Bin 3811820 -> 3808072 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

