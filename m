Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3295CCC6B39
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRcyzxmgidMhHq2yYqji6ESeNhh9z44YPDLaLG/n0tk=; b=whc3Bmav7qRTzPFhCnChr8kd87
	+G/xTLa6MnzVlKR55WkZPB6Mgaf+r8EpYvqaQuxscR3R9boBVsiPuayZ2twYFDu8fafQBfyguJj7S
	jp32YlYQNFIkz3q08wF8KnBI2WPtqDCjsCA1NekMUfccxYG9+Bn3HOrnHp+sP+qjH1QSrYbRGZbBC
	6V2HBxUR85sjwL79J+CwrZa13/QhrgTnilqb5wuV7Relvr+qnmdOd8BzO4i1PIp0OviX0uQHtoTCh
	C7PkRrDasL1LA6jbtF4GJuhhVcGUMImkFyV+JOFPLp2woQF8lw7sqR7/XceJxm0R94VD+fjFV+bv6
	uPlJuX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPMm-000000010k9-2vWN;
	Thu, 15 Oct 2026 17:35:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPMk-000000010jj-2tvu
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 17:35:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FG5YkY2809323
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 17:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRcyzxmgidMhHq2yYqji6ESeNhh9z44YPDLaLG/n0tk=; b=YS+z7bgFMjTyG9nQ
	sMB8HkKmUeszHnO0RSCITsF+yizNww+MxTaNmsNG4I7VCFwgjm3Eo+tLZM9LBDT4
	0bTxx78hW36RrVel2tb4yNQhIA/B0753ohJLUGWlicaFRCVa7P6RE17MORzzFbdX
	IrFjg5Hw2fzWMQWBYwFDYZ8OlQPnJOwE1BXRF58SW8ce2TCRAszlX0pdc8ma0IdU
	TRWf6O3ZUjjbpVhz9ckSixYf9DUK2w/nmus4wrlb8z4zcU7r+gfbC3GFFw1GFYYj
	R+df2NJRkDUJYzJXe/GLPAWaEsKsEu/lu0pa1WqIfb+83Q4lU0tmaAWgURrM95OM
	g+Jpsw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54uujt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 17:35:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9754417eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792085740; x=1792690540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRcyzxmgidMhHq2yYqji6ESeNhh9z44YPDLaLG/n0tk=;
        b=IwklPnfZeyhtctI1SUVcxZ8azeeSHOVqFGTnSUAUsZZsuYiPOT/f888VLFQ6/dxq2+
         qkbRHVzfBicOhBQoGFYKOyLpN6Rev94+n9N83JvkwZ2XfDx+8uRZUlQzPL1yDBXi9nmu
         d6n/6h5/uBC50E7U6q0OEtmvwRiCaGm4etdGnODCxfjK7D/rbj5o7a0bYz/pHnocYaGR
         aJ5gkNPVVSQVoSdxMNocLf/ZQE15I4LJVBVKPih16DoelyEOCH7ffMvC+3AzPIDWsha2
         CrdFidADX5UoFgq/vAUYD7pGSOAtRi+Db6sRxkvLRmMl9RKTyp+oFWyk9EhMFBtzdOwL
         IBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085740; x=1792690540;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRcyzxmgidMhHq2yYqji6ESeNhh9z44YPDLaLG/n0tk=;
        b=ZiprRuR79NDxbeFWZqU5oJeUdYHnl+nJzs23R1DLydXCQ2g5AALX1w9MzIl6Htlqzi
         CiMcv99nF2ZMvKt63q79iSHmUBJPRS9+MmdiIOB7wQp6b6y1AmPMYZ+SotMujqhPbqDT
         yufBCnBs+VWhF3De6qF2RrU7ECoW5iGIKFKVeDop9tDTrgBdbPVZhp+uyOUaWYx5Mv4u
         uCtbCHO3eEKLXdFd9mg0IuMt7vmIM+Sp7dG8srwYftyoIf8MLoI2Eer6RC4ahs+ZcaJ+
         /Ig+SLQc2Rco+ql6bqRJWbTjsuiBsIWVxH8wJqTVrMNL9Eh+WHLn3s+K/NH9OEJcF+mR
         fW+w==
X-Gm-Message-State: AFq9FYKfh9pI+Ra6wgI0wdB9hOOjZsWD5TIwjjV97zJTbfC87TZaREQV
	1Q4Nrma1WJwNY0RiaL0s5YZhLlMmOU3rMOFAm908TAOJLxSQ9bPoaOrqoko/MGTsSHqdA/n7dvK
	J/sEvuDfDhk4337hE1bXhmUd97hVKh40GzaAIZw9GH9n3RWMpXMs/v94gJWUclcFE
X-Gm-Gg: AYBFou2TGzeFLdqJBd7nTx5I2NQvH9AghFIxRTZ41pYigBJQi08jeYMx8FmBrSCa7RX
	yJ02sbPLhsc07obzCGCHTgH44FkgnNLCOXUz5qa6Z0yVED9y9O+bLZYpinDLNVRNHsiuwHIy0oJ
	jhwRer2YOPS82EQVJorZLB3ruH6pGKNVBB+DUo06Q5ndyY6QQP1leS4Pac1b6YmsU7GC+Xf5AAM
	DBJE2s9b9oZbojgzKvaAJy+J45/olp7gL+BUE9F2JlRZD686L5Ht9x7G2bxhZeOqxwiU4xXaZym
	oFA0QWVZbG73QPcnTlkTcJ+6Qc/K/g1A2vpWB+tHO0Vw+K1vopA3suxFiiQL5eV+/RckAAoEhP3
	Hxn5Z3PaoooqCcOBye7yznP6FXnFmcOYIwpV/6kE9JGg=
X-Received: by 2002:a05:693c:41d1:10b0:35d:74f7:3b9 with SMTP id 5a478bee46e88-35d74f71451mr9525041eec.33.1792085740269;
        Thu, 15 Oct 2026 10:35:40 -0700 (PDT)
X-Received: by 2002:a05:693c:41d1:10b0:35d:74f7:3b9 with SMTP id 5a478bee46e88-35d74f71451mr9525002eec.33.1792085739523;
        Thu, 15 Oct 2026 10:35:39 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36058a8de1fsm381704eec.25.2026.10.15.10.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 10:35:39 -0700 (PDT)
Message-ID: <f4c53076-eb99-4306-b595-7349aeba95f0@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 23:05:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad10eed cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FeBjiSnNOcrKIJN5QMIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3MCBTYWx0ZWRfX33/RSwRc07+p
 ZoN8bXx1mVZNmkBtqfAP4cyTt4mhV6DlDsTCd4qscjsCuIZcSRoPm9JPcxZc5upGKtgCR0dN6+w
 TYODGoLfn5ChL2HUbyO/GjrPALibsDblDlF4f36R1IUFaQhn9DKYwRniaKVuP282L6AEHyT6FXh
 KadynYpX9URpb18wEvq1M92iVajOyvzCi4MkV4PrWeOeGaDNOVMbBbKATWg+w80+RvueW/ZQ7H8
 YFScilAl0WQIkHmSeItfvTVdxJ1LbAzBR8JztQmW/n0TsS00EtS3LCS9AQmUs4g0jKWwf6HApaO
 GncVaHtnoJv5EONC4xgDHBKJAohC3NQfBrS4DGYAmsn2Kxz8L888sNZQELRdyoEMmwummN7ZNKZ
 RSJho/Gg6Cjz9U1xz/s6qYBUqJd6TbU0dZytvud4E5tY+/l3dqYJClOO08KQZlzM5tAREzP/vEl
 OyJaHaH57FcNw5PdXqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3MCBTYWx0ZWRfX7JnFND8fKYoZ
 C9hNUWCV9DmZ/ahK1n2adNC44zc2Oo9byJ7WKmuTZ51ps21v0wz09y1oyFko+mbsGG7bI4TbAyC
 IwJTnvo0uMQOX38x6g+ePmRw+v2AFRU=
X-Proofpoint-GUID: sC8yQYgu5OWYu9Mr1LFvXfZPCaa4k7Si
X-Proofpoint-ORIG-GUID: sC8yQYgu5OWYu9Mr1LFvXfZPCaa4k7Si
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_103542_863130_DF876712 
X-CRM114-Status: GOOD (  13.73  )
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

On 9/15/2026 1:30 PM, Miaoqing Pan wrote:
> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
> succeeds, on is_sta_assoc_link verification failure, it takes the
> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
> the dp_peers_list.
> 
> On the next connection attempt, ath12k_dp_peer_create() finds the stale
> entry and returns -EEXIST (-17):
> 
>      wlP4p1s0: failed to insert STA entry for the AP (error -17)
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
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

