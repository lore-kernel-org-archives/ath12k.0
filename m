Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520D6CD6E56
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAtem1ZMIFkHJBQil5FvuprGA6SCScdsTuwFGekziuk=; b=VkDZBuIlL+mwmiIYERtpetnVOR
	j4lDBxssyHp2EozaFZ3nvL93BZKHhY8JAJfcIJnCk25U+K7YOinNfdODKRTcxfh2UF+LvHZbO4bwj
	AkbwLs9V+R9a65/cIQeGfYEAK/zWeKzs+PhowNEX8UJLg0c7RR+NvWbn6FidT3NX5u4fB98tbpDYm
	hdgoBrjGpBIymigTIGhyHmkqGdS4usOVQ7AJplQxCO6GXqpXD6NhFCU0Cu9SrkWwD5KvlnZWzUyso
	85a9p7yhrCMcULfBk7qEOkPiaNF2UQT6+kTKzAMgGJv13pDZbrJYqKVlU9WhWWVdSl3ybjhM++sCw
	VMgH6oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzy3-0000000Ad5o-0Jho;
	Mon, 01 Jun 2026 10:33:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzy0-0000000Ad5M-3kmk
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 10:33:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6519Y6Gr3372678
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 10:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WAtem1ZMIFkHJBQil5FvuprGA6SCScdsTuwFGekziuk=; b=oS1aQXPeFxQJvJ3j
	vKdwKl40abijxch4yzoaVxKseHXWrEnmp8iW8+yubcnOwtyrmO19cOi+h2/6S8D7
	8wRVJRFUTcqDiLISoNdueBlre11qByAzZM15mjC8bO+IJZrmPVaWBRyAMjYnipCx
	/PQ6cSQ1z+pqaH/nrcZ9X6zcIGPFVx0gbcijOcz9brIBrgpcytaJI4386ju1aca6
	OEEwrvSBS/Qb4m1SznqNPQPiOffza9mhwidIvtMH67m6WMScgX74L3/kvDtvCZr5
	g90BrNe5YI7zlFBfIIEtpGmtSN8KZ+K640jrQEdNrDk0fZRy+pcYplCKHpQ4GRGh
	CjYUcA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh889f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:33:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423d4d7419so2032630b3a.1
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780310035; x=1780914835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WAtem1ZMIFkHJBQil5FvuprGA6SCScdsTuwFGekziuk=;
        b=S3iRi5imeYI5DoopU/tqDqfZ0L7X+fgmD6TWrljUqy7hQQWBydCvZkgIov2pvPuhy7
         OFKpAhty9PhIxi9KRHOP/sDrH36QXWyE7ygb23mS6stWBTJohdCGTqlu+4eIilCij5Mn
         cJFaiwLL2wm69DA+AJzRlQVSQC/GEpQMrVeOoeGn/4AGF5aBlidSH+0Bc0YPK0bN33br
         C2v+NZr8YLN28O66RPqEkH0ljIPkMAzgeQwuNa74wwNwmbkYjIQzCFd2ShQ33G3v702r
         PjwiNQ7uLIcOea6cIBVyMG0VMQJ4h/nqGFSanBaF7HDZSQGiIItTXeor8TBOVgoJ3ykZ
         HgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780310035; x=1780914835;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAtem1ZMIFkHJBQil5FvuprGA6SCScdsTuwFGekziuk=;
        b=U4BycyInT++kWIj6OcHQozhyuFfOWksDW7MVR/S2tVQssbSZEETabVcpcGSOniqycI
         WfBOfKUqqlV+kx+RyLdz0VpJ4ctwuqRChWOKsSWdAH5qVLR1TGmKFpNXnHzdBZZ7lyT6
         qMF5M/3H+Cf+Ef5K+iTjCQqUBqBSC44WkEqJho51UCV/3jiSU0q6O9z+MLOQju8OsVNT
         hN+7P2CouJCsWRqMYOmBwysdX/LmaIj3xSIKz0knJCt8KA+cuWkpiTTUZrCx1l5U0jSw
         bltTquZSmNipBu5idag74fGChSUqbEwGiAXoEMn7b4+KjcIfKNYCwwcKtx/WnclbtlrG
         y+eg==
X-Forwarded-Encrypted: i=1; AFNElJ8HnCJpxFXqm9B3kV9a9bX+o88bvGUFjikwUea2EO+Z69JwNLvMZUa8SrffbzfdS4w3KMiBhR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvUKzjeE8My3VwZazpWiILXtp+nU4LuBoq4P0FkvT9zJ5TO0w0
	IHnRYOYZ0EfPwSZ9F/dNE4vsKIrlAIF1fzz/ftrvqEGFiwSqQyUqgsoNZ6jqRZ0M2svhJfaba1m
	nFUec4RckgVluo0dpPbKsZPb+igKEeL8LjkrIg0xTcYZRh0DvCKcudQF6/SKRb3vx4cs35LWw
X-Gm-Gg: Acq92OFFDZ+LNlvx6L9R6azUzc+BjuzyAJRLV40VeGVLIuB0ZWRWJKKUYjaYpE4AD69
	gdhZedeecAEAj5SZ/bWFEH90n9yG9fjTvYRGsIv20iRMtz893+KSCWDCwmL58QFdKouuuX+DIBY
	ImMN4ApSngBpIPvjveJtNAta88FeFkzzOMDUV4sGRDc89wEOI3Izxm+AoZ8AhRzdXG+dxwNOW41
	4qmfptqOC7zlgL9JusXzHqek3ec9Uy5YcRjtzCE3X9p+j/OYrR6knuVobOPvxsMCbY9gW0zEZ+/
	k/oTRfN9ISsqrfPWlkQ/xTB0zmrO2xr6+1DwEoEcWlJYl3jhlqB3stwmCxxHos3O0lITLWzXi5U
	7So4gDIy/USINQxqvJKtAqXtNHD4+6EVhCqUbKYxKvEHWwt8dJe3kPxzrLo93oANPSDGCyPu4
X-Received: by 2002:a05:6a00:73aa:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-8422bcf2188mr5755259b3a.45.1780310035426;
        Mon, 01 Jun 2026 03:33:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:73aa:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-8422bcf2188mr5755236b3a.45.1780310034928;
        Mon, 01 Jun 2026 03:33:54 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423aeff467sm5211246b3a.25.2026.06.01.03.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 03:33:54 -0700 (PDT)
Message-ID: <312a25ff-c887-4e3e-ada0-6ace79c85b7a@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:03:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Prevent incorrect vif chanctx
 switch when handling multi-radio contexts
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20260522091828.3199584-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260522091828.3199584-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A03Od0x2aapkeZu0lbh3MUbBDtDKaaoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEwNiBTYWx0ZWRfXyoHXNAeWcywR
 J3BmCUolS+5Nz7PuIFdnMaZK/Z0KFNX0owfHz605ysCgpVy4djjzChz9kNBXpoCGSRtNTmbQNx3
 YeYHEBipFouEutjxqr/KB1s69mWttSDUcJ2c9XMfegVobKkghit5kPfhkT/qEsjcO0I269l1Ds0
 m9wlo79zMZehV521NRddK7kSebuQoGQZWmNQHIPzaN8OCsTRouR2j8lPk4OsWPPb1VJ2SZz4WBb
 LiRpuGmCh88efxS7+szHMyAX+eiHmrgQWNA4HE9HfZz9kgHLSCC96nh4scj9I0s70bjDXP/sbpt
 C2RAX8YVn5MgrdrZHlt1MBgCj7M/jUW/lomhP6l98RtPbY+DcfMfaSbfQbGmJHgRKShwhEkQtEe
 WcJwGC1T/B3QpKfgFjbKGEPozAaLebUA7yau+67KDT6OO9rqU3HvoEZ0zTjfJhG/uVgJQ4go4Tb
 0Y2LVbIERGx0wKbBVJw==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1d6014 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8GVvVDYDP2p1e3aVpqAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: A03Od0x2aapkeZu0lbh3MUbBDtDKaaoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_033356_940056_00A91DB2 
X-CRM114-Status: GOOD (  13.55  )
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

On 5/22/2026 2:48 PM, Maharaja Kennadyrajan wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> When multiple links switch channel contexts around the same time, mac80211
> may complete CSA for several links together and invoke
> ath12k_mac_op_switch_vif_chanctx() with an array of vifs spanning more than
> one underlying radio in a single-wiphy configuration.
> 
> The driver currently assumes that all entries in the vifs array belong to the
> same radio and derives the radio context from the first element. On multi-radio
> hardware, this can lead to incorrect vdev selection/updates and may corrupt
> driver state when the number of vifs exceeds what a single radio supports.
> 
> Fix this by validating each vif's switch request and then processing vifs
> grouped by their associated radio. For each vif, ensure the band does not
> change across the switch and that both old/new channel contexts resolve to a
> valid ath12k device. Reject attempts to move a vif between radios (not
> supported for now) and return -EOPNOTSUPP to upper layers.
> 
> Then, iterate through the input vifs, collect all unprocessed entries that map
> to the same radio, and invoke ath12k_mac_update_vif_chan() separately for each
> radio group. This removes any reliance on mac80211 providing the array grouped
> by radio or sharing old_ctx pointers across vifs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Co-developed-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

