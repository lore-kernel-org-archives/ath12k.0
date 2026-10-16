Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A00CC6B38
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 01:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2AdVVW/1VpGBm6jZek+loZ/L/qPi3e0KDm+GCFxSGY=; b=ReIvr+eiHWJ2M45iPbFc1qR/mj
	BW1e//kmTt9idbEsYJXIVDHdPfVAFi7lXsA1Yj83rNnAqLCXBZg8mfYL3N9mThTA27xzmUHPTC8u9
	e3uFFA2BTIt1VXuXgKBVzrdMnH4c9LK9GiWRBKfO97HuNA0cVY5mR8261sBeAFD1Ue2cDrq1V1MZQ
	NpjOjTp0xuQOS+ZLKy6pYjSJNa5JriS0sNMmzc2R8jcuPLnU7FvqC0E9wovkU4HZfYwlqyVkSfJsN
	c/7MWaVWdf8HuRwt+92oOwk0SpLevCviS4dHhyy1Xk5Yb2UOwpmMwbaM1k6YYkDKZGuVT81tgtcIg
	l4V1yAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWzF-00000001iCN-3SKO;
	Fri, 16 Oct 2026 01:43:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWzC-00000001iBv-3gUx
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 01:43:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FLmS5G4126406
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 01:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2AdVVW/1VpGBm6jZek+loZ/L/qPi3e0KDm+GCFxSGY=; b=QL6IvYB9Pb1vVLzF
	IXjkvxRV9jcqbQQ/dczG8OCsZqgZTtLmqPFKo7MEEsmtIYUS5mxCwuAZM6UbOUD6
	JlPCHhp0piwaz07IGMiohubcoMP8VkWm1sDmT+lEchO1PzoR0L+J2lzKgKYa1wtw
	zFUbRUPuJfoKFVtbd7brLJnWKDx6RiGrwl597g11T+YwCUqHu9DKuCKVo33bg1wb
	Nx5ymk383xgIYrsCTX84a+IledBVnWqd+GApJ6MtDVcTurcd+lK7Mxe9EEIqWWVI
	y6WezmyliYkzcpF0fyum8d70JNnAoE1LcevN5/LUNqLQr8w02x/yChdaIRp6BZK2
	NsJCRQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m2562-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 01:43:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8862ed0539dso2551025b3a.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 18:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792115033; x=1792719833; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d2AdVVW/1VpGBm6jZek+loZ/L/qPi3e0KDm+GCFxSGY=;
        b=DfntW0pTiTXUqEBRcaeDPWspIiyze1V0yUjDQ1ndirj7qTe19rNirUbpE8W/T9OwcY
         8sczUQ8GWPwpExAv69CYo424q+Nrz0o/20VYn1pRAXtf9EZ2I+Sy3ER9sWcYFdKB9cWf
         wd1pG86WVxRibuiTVf11dglr6YjE3lUHqPb8Gosah9G3wQ3ZwXP9P31mZ8mSDdZJEzCu
         BurvQutPMGT57vVZF5fGdspwVS+kKToEbPXCFJmfVZNFYADCxZ3tHDvPo9UYfmrH1z/H
         eMXBddUrawwfiA6Rzr3SE2IAwOXE/+ijEVSzgR8aMliJL21YK/xh0+u2fgXzPWxqYDTx
         RtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115033; x=1792719833;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2AdVVW/1VpGBm6jZek+loZ/L/qPi3e0KDm+GCFxSGY=;
        b=dkF3u5ejp9N7LN1xz+B1l2jeXXQ4x2FXd4tRAz+sjC+nGvPU/r1d5m5iYF37CSDRi7
         RQexxUV4jaXz7q0XDIjnhYNpsSQolu0S+I/HVtm5rbZbWx6w9XCIQLEnPZZWxymCkwge
         NAPJVFxcn5MEj89nhhtIO26yM3/tDjawtxmxlSdLMMkUm3mJmUrB/tM8eLNXN9uDaUKi
         nQzsZn73X1ldxESbUVQ/PVHi2tprdkJLiJUhxRn3oA+c2nJgV964ML7S5aeLYFOCzRH0
         HPqQ4MwlE/CLLt0POuByk1y2l3uUjrvT7IOzSk7Td8+lt5j/G4t8qgbQizh6iN/0nAFX
         V1IQ==
X-Gm-Message-State: AFq9FYI1MZ4tqi4onean4ZtADZOP7acdOdz9+kh8qbsSgXxwpvNO5reH
	LtEurYXcB7Piel5Fhn2jHlhvh9JjhrEzq/YzNmbhIIZKAaAusv9lY0oploFQEEmpt0LyESBagIQ
	rrtnEEp/FOnh7O/9rKuv6uePnMWgV0VkmNSmBsDG0vmrBa0xAlrQjJK3yikN7pXGt
X-Gm-Gg: AYBFou05OX/A4E15vE4UIQ59xfquuqhiKs2Zg5/8bqJ30oVsj7dm306Og565CWKvbVr
	rlwlyuKi7BLsR9BUs8iGsTxit+dScjSK/q889tsN8dbl6TRQIwMWVE//WFKXj45CzWH4TGVGNxp
	YfjShEvyB+DGceD2jRdXck1CN2a/CeCV3W8xLrE4yyQZ8KWJFoNEFONgdLft3DxOCrNaH0I1u1E
	k7TU7vEd66Y4CoN+tv3NDW4zfAREHirLFFbnqCd9dpbWkdBw7QtljIq76S7V5/pcktly19zv9et
	WQiSoIy0VQmZYhJ3tT+n6jtlFueMTP89CitmsOWUMwxXqWentLk41WOddc6MS7KFRNDS4t8+Ofm
	LhnFJdd1C+yV4D/vu4TCszhMOrBuPYfu+KXNCYazDAwnA7QMG/ReSCDkWk3f9cyqVnoIx89Q=
X-Received: by 2002:a05:6a00:2c85:b0:887:17f3:94f7 with SMTP id d2e1a72fcca58-897c3ef90dcmr17799430b3a.1.1792115032737;
        Thu, 15 Oct 2026 18:43:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c85:b0:887:17f3:94f7 with SMTP id d2e1a72fcca58-897c3ef90dcmr17799413b3a.1.1792115032341;
        Thu, 15 Oct 2026 18:43:52 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f579456a1sm326500b3a.35.2026.10.15.18.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 18:43:52 -0700 (PDT)
Message-ID: <55cd74fd-cab2-497d-83c2-82e485b1dae5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:43:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad18159 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FeBjiSnNOcrKIJN5QMIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: SCjcxSy_Uxwez_zIgXMiCNdTUo6_ELky
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAwNiBTYWx0ZWRfX1T3+CnOJ2lDr
 +Vg1UxQ0vm2OBpTZfQuRbKEqgptPmkJJsNG8+JLCHI54hw9FFpSUpzopjm0dPZG0lse/c+K8ReI
 lmV8Eh8OQ5PB3Z/gcOwpT3HamHUyZIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAwNiBTYWx0ZWRfXyjp5XOa2Hsdv
 ZdRT7s4onQhjRQY50kkxuyE2eGuxtrJ1c3oAmG3bY+350EvCVsVtj4fI+1wfOcXWKXrL97yZCgJ
 gAH0ul3wAaUtBAmqzECNCLL523dBKmxFlF3gQ3W2lg/aarvlSBc/I+r5l/kc8kFJjTv8QrtIiuw
 pUGeIY6IWxhcCblB8Rf4nzvmL9xCTN4smO+c42rali5yVgVo8rIQU1jLTj3Ci4vMF++OV8oeRBo
 3X2YfQXBnIBYct4hW5fdY+wwJJqSlzFj5xVEeaL+OP49o2+YF4P0uzU1kroDgodPO56xwkkzy5Y
 Lm98x+Bg5tp/4LHAL9g6hoMvN5KkrhyXeCHD98lptUnJXsq1NE5Ug1eFUUDRoqRvTXx4bUiWW+m
 62u1k+wKCxqJ9qe9XPdTjy2QeGZlVcBt/r7DEg/48T2FEZhi6/gnPXJVDctxn8wYlwjl+bssDgD
 VwLiKGAdW1b+rHpW45A==
X-Proofpoint-GUID: SCjcxSy_Uxwez_zIgXMiCNdTUo6_ELky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_184355_058096_78C85F8D 
X-CRM114-Status: GOOD (  13.18  )
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



On 9/15/2026 4:00 PM, Miaoqing Pan wrote:
> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
> succeeds, on is_sta_assoc_link verification failure, it takes the
> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
> the dp_peers_list.
> 
> On the next connection attempt, ath12k_dp_peer_create() finds the stale
> entry and returns -EEXIST (-17):
> 
>     wlP4p1s0: failed to insert STA entry for the AP (error -17)
> 
> Fix it by changing 'goto exit' to 'goto free_unassign_link'.
> 
> Also, there is another error path in ath12k_mac_op_sta_state() that
> jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
> undoing the assignment through ath12k_mac_free_unassign_link_sta().
> As a result, the link RCU pointer remains assigned and a stale bit is
> left in ahsta->links_map, which can trigger the same -EEXIST failure
> on subsequent reconnect attempts. Fix this by redirecting that error
> path to free_unassign_link instead.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

