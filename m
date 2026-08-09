Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B12C5AD5A
	for <ath12k@archiver.kernel.org>; Sun,  9 Aug 2026 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=; b=k9Vcy9/3Vum+U8VvZxvP7gTY7f
	YGl+M7phIAFv8HxUQQExyfQpQ5sLMJ0sq9Lj4rw1+0+cJdcKCaH3O3vtuP3YV7t380BljA6sp8I85
	plvJFwEWaNlaxwGwW8Y7Pbt5QmKmetWTTd5beR+BvjkTzwDVf9auWbtPmA5G10QBJv+y2+n/XWCT2
	fZ8kagN/5RFG9VcwvR+wRT47DoUkAKFocJ6/17hznLUO3wxaj3dJZbO2+KbTuh4Cex3HO2Q9t8GMw
	2wOPbC0kec3fDxIw/NAusAxcjaqekS2M+/EGrFQi6a1vGwI9mRxW9XgwOLdL/h78IqsQbT/rtaXX7
	ab/h4CVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtCxk-0000000ApT2-0G4s;
	Sun, 09 Aug 2026 23:29:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtCxh-0000000ApRt-0VOG
	for ath12k@lists.infradead.org;
	Sun, 09 Aug 2026 23:29:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LDxB8760838
	for <ath12k@lists.infradead.org>; Sun, 9 Aug 2026 23:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MgifLTeWoPs7xR+NoGmw3cPD
	yJjBTZUCzAC0a9BDorI=; b=pg3axF+Hfg/EcnBJkRW7KwIiDyxAwk8LUfQjgKPP
	egMjGONOwsURlCbnafIb1A3SLZMngJxWpEly9lvrnFWRQwtAL02CDxQLDYETMmu0
	2LCKQrg8s+wq/+P6pDGQv7D8fGhk6/+IpgJm/omRqFID4jq9UKrHh2Scz+cvXfkn
	hlYjVdJ1yofirNpuz5DcNfekL5ICEe8AZ1uNsNgpTQbjNpw3jGvkxh+7ns2FAAGj
	aFBdQd8ph+Xa3niJiw8IlWlBrbXJOh+c1iKvkuXyMZIMwHeeXwxCOBg8WhkfTbYM
	ikXaJpf06Nx3MuZLuKzeWbPaROmi/XBUpLDjQzthBonGVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kg5c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 23:29:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so32326951cf.3
        for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 16:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786318187; x=1786922987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=DnBAbsHSkmSmHVYm0B4xQ9RFAW0mJLO0/+N9UPQ9AOFJdRIGwnWuDudzJgebFamKRA
         HRSKbfHro6bb7lB8qNY4/SSmW68k1PzCdyfFlAgEe2r74sWbVrfEpBGk3XBkaoGiUYx4
         hpFZtLi5alUfTeFd9gC90zYibV32XsTKPiPXUtoTaSJr/rla0gRTXUUx5cJdAcgOcDGT
         vmVgLxRUAGkLxgnKxgs7Uo8VS/xO7pgb95bamjpARRzPX52Q5phrO4jjFTjd0iL+g+/i
         HDrgav+wvDYld/Ah0yrccRNC6YP1LqDe9BGOwMEN9sENLxoCdgo317f+gFPT/iwgNlVh
         +SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786318187; x=1786922987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=EuGbGGuOa2a2eY1INqfUAF553JORj0xVBjKJYpmT7uN9rswrmBWWaWK4B5stbKrpBK
         cvCy4dbqNDJc5qO6F6M+FoYPYH9CLNF3acSXMr3ejEZ3HNtU92utUnIV8BbxvRylTDkU
         SaqLmS2dQhxYtz5+l3pSQ24YvQ5M8lLsGytM4QF1mBqYD7mxtVp+dqgbwhzBWOdMBzby
         pgJhCNJGnpUtFJAfSvW6DT8txsRk5kmRNgeOti4P7RHaGeHlXjkfS6Vl6o5gHyiGArcF
         LXPgs+V/ODUFgLKiQaUxLxBVPCUugQ5uxBI2pQmW755/uODHVa+bvDq247BiGsi1gtO+
         H+mg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2bikmIQjkaD/gs75PbV3mX4WMyRgh2phBYe/MMvpz/sSWMxyNDywPow0AKN4IOTZn8NYa/Aw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFy5sbZZqyhAS+x4b9oEvXelVsf1Bccmpe4XCZv3qzaL5kFafP
	Bphx9AuzRl/R2PUvkRNaCwecFWEFUXxlTevASAhXDRZz9ZueXbvN+5XUnXU9nNYY8SwPLRqbyJV
	jQFUIoQBGgW7vTMrkSiB0i+ukrM7YXww8XsiZcGhybZqA72S+GfrBKXV5osXFMmLS
X-Gm-Gg: AR+sD125KmxeCJw+PE2zKonUkvYrVW3MYv4Qh4NvrB+uXCwL3nZD2XGtKYCSPFcg8Ff
	8AiSctCL3qvZgIadf+iHUMxoCtvzKiNPYKVq/5g/6HL/0v3VgU2PeClLr0PHa4V/TubzAgHwSlX
	kUsYHxBIeWpJMRR92nkOySvFAa4FJSVkDLSGdpVD/m4oUXxIPIZXZ0W6n6rW1YRYT3Z+lvWhJc+
	wLTIgcNZqn/ofE0he8kgcJbjNDmk4Bc3lDSW/OtdW0m/UPazl9Mo4Icq3jTbeVymuFH35nfy4IQ
	INpRQK4sZnoOgWpOZs7oL0g5QIvQ0RW6w7Hu6CJQiZpU20rCyJA7EAarG9pTEP4DkGUT0qzKGiq
	M+wHP998dyTtoXGzmQ7AG1fRh744vPOrgyBEV/QGyZ7LRge7ydIw0JJAjtpjpaBqAc917elgsbI
	RRs6hBji7z75w1Hg==
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180714051cf.43.1786318187226;
        Sun, 09 Aug 2026 16:29:47 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180713581cf.43.1786318186682;
        Sun, 09 Aug 2026 16:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050d011asm1631111e87.32.2026.08.09.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:29:44 -0700 (PDT)
Date: Mon, 10 Aug 2026 02:29:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260809
Message-ID: <fj7srjlprwhlbgjkk42uafcjysulte5lbw342tnultbhyijx4x@yxsgw6awrsnw>
References: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RN1WSu7reKD1G8-_A51sAptVWfX8lnML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfXxzhaO9sp9Pf8
 mcfmW/DNN9ooTwIx4gpM/nCFwysRNpvABbJEOG/XKvdVbLv2h64KxnR/5L9BByEVuBl001gqIA/
 Px1Z+LOgpVZe5gkKsQ0cvhqJTxZstK6hyCj1ST9i/Y2EBVroRvlLk7Js4coEimA/bJk73zEuJ4u
 ut/0AuxxxlMSsGCddvpMjLxS1xFZQWug2GNIiJmBRq+hNGTJPyTXLVjs9D0IMYBu2ivg/+UfEat
 lKi+PCTsj2yFn5DMwlbyflJU4kr3+CXcm8WdbBG0SuZU+iuksUlJQbWLxQE7OAGl2nb7GbRJBvx
 vG336S9fJh3mPMns2FmnshhEg0R/8RsdEvEuc/SjndUMYo8qJ6Ks4MgDbIoj5qod0i16BlmudAJ
 N7toErrQVBTrImsU3d0Ps7v4x+M+mOJhtOFupLza1/5WQ2BReSgcpJebRdvct/a3KuTSKUdBMXs
 gFfwEhzW2/HxM6MSIRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfX1MSrKuQV+6bS
 IA5PL1biV2Ac0eHla0GivfQ2mJd0PjpoagUnLSBtbjIqiGSejrnPXW76vYcc+cUzFg5BcthaJhj
 sljSAqKQUOeJxvEtF4zmacMPwW3vVDw=
X-Proofpoint-GUID: RN1WSu7reKD1G8-_A51sAptVWfX8lnML
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a790d6c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_162949_254719_90316FFA 
X-CRM114-Status: GOOD (  12.21  )
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

On Sun, Aug 09, 2026 at 09:56:35AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k, add board file for WCN3990 variant Shikra_EVK

Thanks! Merged and pushed out (for some reason it was ignored by robot):

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1171

For the future pull requests please consider including a change log in
the commit message (so they get recorded in the git history).

-- 
With best wishes
Dmitry

