Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA3606A31B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v7ApoFh2;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y60WYooE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQip7zRv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9cZ1qeIoap6WuhtmxjSEnH8A2cvvyWlJBxLqn+6ctUo=; b=v7ApoFh2cO87BS
	wcNnbdjF+1AHhnfFNUGM4GDpY/lahFGxTdccUNk9EotyFsuxhtxGQ1f/Yx0JqqjkcfKEfzani4IF9
	U1oDYCH9JZfZ6B0gKheDodMSxdR0HQhNmYYkAotP8s3LQDj4Q2yfQ03D8Lva6zumsk8w/FEps39/u
	ouV4CR7XopcCuSJ6vd3YsOk8nyKGUkSCkoO7D8TNQiOYNuWTmkV4M/UDCQZT9bVuppR6M7sFHdCXP
	t3hfaIzQmZSOtLp6SDgjlK3b1XhyrcK7dFfrAChgiKB2STKiJYXgsjPvgdwNab5OqigqV4+mS3l2u
	BCrXlh5qm/vNyVVGC2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoK4-00000007gkB-17i0;
	Thu, 05 Nov 2026 03:39:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoK1-00000007gjh-2Mxx
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 03:39:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oXOg2889745
	for <ath12k@lists.infradead.org>; Thu, 5 Nov 2026 03:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cZ1qeIoap6WuhtmxjSEnH8A2cvvyWlJBxLqn+6ctUo=; b=Y60WYooEjcbp2UD0
	6k0As6ut0NIJtcTRmGgmD7uUGhSdR1zzxb4Jhonse5ZfhOVhttnQqOzNQvUHBAVt
	+8lpLfarYxayFOdwYkbXCchSvK9zx6ijNscCFyUM+xbYhyMtarvGkc7+0QBBjN6C
	ui3fJQf6yTtYy4KLY0nvC6jPXon79AhcmiE66heBcaAL90vmIQHyGxriIGKRaQAk
	rRPF7DSYwD99Wwro3sqpeTx9+LhqMfRm4mMjthIWa/RRFpnq7CzcrrXrbURK/0ks
	pXT26TPB1ewjtwMRUAuwZp4QoGrLWJ+hTwCmk8I/dVr9crm92mT54uFPj48vO6Rk
	sdkwUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br2xh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 03:39:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a065e2933fso1883439b3a.3
        for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 19:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793849968; x=1794454768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cZ1qeIoap6WuhtmxjSEnH8A2cvvyWlJBxLqn+6ctUo=;
        b=jQip7zRvsJeWncHYzkKdtiiD1dR8HmQdf+gTV89rqIavpeE9LVjp2UnXXtYXBqjzLB
         DyF5yFx+S16atqVPz3IyYcA0nU7U9hs31l0Jc9vpz/LV4ZqQmPI8Sg0dfzV+mKY1CPuU
         VIlu6YVrKdMmt0dTm/kWU+oFYdhi1w4nrHtH4RZbNRDXpvah4WosFSOxg7v6I5gw9bTg
         gNInfvbQGcKOy/wNqdwHepnxU2rpg2/0/V/f7Fj7PLDQeHWN7yYFak+qR6/i24MzrYOp
         VjDVGtJWQscEp4x9z5C6u8ACHZSc9qLtrixFK/+xvo6JfIhSNPo8V56kFOtEvlL5dq9o
         jVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849968; x=1794454768;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cZ1qeIoap6WuhtmxjSEnH8A2cvvyWlJBxLqn+6ctUo=;
        b=YeP6FTOyu7MWWt8BWeHs+aVUWUVBMbjlB6F9PxOvUzpJqYNIcdo8MzMhhZdsrcJoJl
         TWbvMJ5br7y++QuHsJEhUpu0WejgXG7HLwqNgarmLexLrSfZPSj0WLJFOREvEhBXJGM7
         Srtg4qM9qZ8wodVeSxCtYLR953+wZOeBhqxFapF60b7h5eVDAX8Wt1EH25sMjd/HKbLK
         DuIhNJYVb4NBPr/UTrmvVRN0aF4SLhNtPtEt7U6x697uU+zo/0C+CQS8+qSFz8oG+t0Z
         nqha1V+xcRuV8SztDVxER8q9MX3gD+Dkdog88+R6PC18+dd/aD2bEtKCtfpLevTUljW/
         gtfw==
X-Forwarded-Encrypted: i=1; AKwUvBzkJY2PpK40U1bits2WjspOxMxlcqIlhdKzPe6/kStA8Q0fGI0H6OVxmbp+V6kl8pVgIwys6Ec=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Jk4G+7dTd9wOLfXBrqrKLN/UWekOT48/KMvmiuoR5FP2yKwuS
	EVAmsumvm3XPS7Vnzlh+cXEZNM5DRtvSbPRtd6VAakab5wnauB94sQGwcWGvBl33wfyTezCxHEN
	WxkfhXr5chWQ20TJi7v8LP2E0XiClKX9R4MByVunas5g6jIZnNqPntxhP3nxlSpIpiSoyIyeezt
	s=
X-Gm-Gg: AYBFou1TGGAVxC65osMWjL1jBOvtnsvTjc0sKfSZ9K2gcUlbJr3gz1hpaMPaU52pdw/
	B2k0q5419C/ZZjABs83WstJq68AY1AehD7Z1iBV04y5j3qty53NZyqpAnac/t398C87iRyE6J5f
	2QXGn6mCRTJtAtgfJpeGlIMjLCtsQCIlii5NO1VHOnYfNBffWS6aknjbJnheW5lW0CPvs1Wkg8X
	vqs5hFKFgajI4i3taM4Yl3MY51ibH8USGiQqV6yI/sF+uGJPohyBwEEnA99Scxal6TWQqRFt3BL
	BDotgh9/hUj2dNhCAx3sxmDrZgwzcRJLBhc8K3ABg/iB9BDLreJBJgUE5hiLbsE/RGqQW8e4oW4
	iMLPtDXfSE4RPtCOm6rA6bqxA/Q0lQr56PExoNEpzoHWPyb3ZGOb85C4dAr+cfJx34j0LZWv39t
	LZbNaEKy3c83PICxGhetEKf6EILVnyzp8ZMj3b6hQLXJyu
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr17517983637.3.1793849968038;
        Wed, 04 Nov 2026 19:39:28 -0800 (PST)
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr17517962637.3.1793849967530;
        Wed, 04 Nov 2026 19:39:27 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb5d66a91csm31103a12.3.2026.11.04.19.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:39:27 -0800 (PST)
Message-ID: <aaec7985-3e18-4c42-9359-a8eefe56729f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:39:24 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: board-2.bin entries for 12 QCC2072 and WCN7850 cards
To: Autumn Ashton <misyl@froggi.es>
Cc: Birk Skyum <birk.skyum@pm.me>, ath12k <ath12k@lists.infradead.org>,
        Jeff Johnson <jjohnson@kernel.org>
References: <179381165259.84724.9229191626653570162@pm.me>
 <35fbfa41-a636-44fc-b996-9295e265d515@oss.qualcomm.com>
 <1a1a9c4295f.84a35c301644175.6375359294054476378@froggi.es>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1a1a9c4295f.84a35c301644175.6375359294054476378@froggi.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAxNCBTYWx0ZWRfX9opkwIkZLQUh
 eEFmSIg2ARC92KME5BppQUGiOfOikXgRx5E6EiEy7HwNX+wTKeH1fg+bu6sZd39qmJONebsexsb
 QestM8Rr7u796AfjKI0Mr7H/oMSnaGTAIlcFrYpkjKsdxMIzn7rMjHtYALlqsivRnZotDqQX+IO
 VdTmuSt+oCPClkfHThA6Nrd5Hgo5f3dW+qwXv9Pzx4w4j1KUECk/bODiJAd3/u9xMY6LMMFDg+m
 F2RBpG/uARVaQrNcvyX5btMafOoPM39WdgtNq943zpXAYIp3hMsU9HbrRfedP0jHvLDoDiQGk6z
 lyVH5WF7XH/k0SBoBUOAgivl0EYvlZdZwrUpYwX8pWVpmjbjg48to3yoBcabhrpL5uBIUGqiLtx
 SJRzhiU8CN7oIZxdFB5MYTnTGY3oN8Sgg6gy6prU4bnAiemPLHeJYvcd92wm3LI4tNbU5EuUbsW
 xsJumcsZaN2NlhbXr4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAxNCBTYWx0ZWRfX+biFc4ix4+HL
 RMNoDktPtHVQkIZFptxMlFu5DNt3524+mHs8G4uiWlD/rNq2Z5E8CjPnk20hpxA+WI+AKGtg0rA
 MOHTpNwv1Om7W/r1bDA7OuYBkMFUDzc=
X-Proofpoint-GUID: 11K6UrwDyTsFiR9h-IqtirTRFf6h4u2b
X-Proofpoint-ORIG-GUID: 11K6UrwDyTsFiR9h-IqtirTRFf6h4u2b
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aebfa70 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8
 a=jawPEVn6rQXAkYD58XUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_193929_613073_4C1DCF17 
X-CRM114-Status: GOOD (  13.56  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/2026 11:32 AM, Autumn Ashton wrote:
> There's a Bugzilla entry for the Asus Zenbook A16 here with the required firmware files, logs, and board-2 modifications.
> 
> 
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=221984 
> 
> 
> 
> https://github.com/misyltoad/asus-zenbook-a16-wifi-firmware-patch 
> 

Yeah, I remember this report and I saw the same VID:DID pair, but still want to know other
details to make sure nothing is missed.

> 
> 
> 
> 
> 
> 
> From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> To: "Birk Skyum"<birk.skyum@pm.me>, <ath12k@lists.infradead.org>
> Cc: "Jeff Johnson"<jjohnson@kernel.org>
> Date: Thu, 05 Nov 2026 03:22:15 +0000
> Subject: Re: ath12k: board-2.bin entries for 12 QCC2072 and WCN7850 cards
> 
> 
> 
> 
> 
> On 11/5/2026 1:00 AM, Birk Skyum wrote: 
>> Hi Jeff, 
>>
>> The ASUS Zenbook A16 (Snapdragon X2) comes up without Wi-Fi because its 
>> QCC2072 card, 105b:e14f, has no board-2.bin entry. Qualcomm's Windows 
>> drivers list eleven more QCC2072 and WCN7850 cards that linux-firmware 
>> has no entry for. For each of them, the driver's INF sets the same 
>> BDFileName as for cards linux-firmware already lists, and those cards 
>> share one record in board-2.bin. Could these cards get entries 
>> pointing at those records? 
>>
> thank you for reporting this. can you please share the dmesg logs ? we need the driver 
> logs to identify which exact card you are using.


