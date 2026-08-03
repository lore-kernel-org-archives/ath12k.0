Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26FC55162
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 02:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7RjX/m9QZtxkWfjOdvYYFL7PaaKqNCynQAQMzIlVF0=; b=CzdAKBmHGJCvjVAvvrDhQ2CP60
	AhXxh6HEwpuS2P8gb41JXpu3d42LLOAfltoegjuLKTeDB/wTIhPoN0hYtm7oag36mWKUJNTWJm1It
	2TavhNZG0ACTsr9KA/JV8xbrWPfUGhQL4zAZcr/ub5/54rfHAqio0uf65LMfqE4Mk90sOFyDuhWGw
	gks6tY92+G5kRsTK6nMuWzg3zVW9/amgrGaNR1uzTUlRSdpt6bNh/Yl8Yhat+voJze6WM6FMmor5Z
	pY3UlFOPeE3aiQd+kry1e7xxGs/WhZBwreGtQvE/YIF0mAOajlzt6glxWbYk2aSYcoHcMohszjiWt
	gzasbNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqi0B-0000000GBEu-2Iu9;
	Mon, 03 Aug 2026 02:02:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqi09-0000000GBEa-0mt3
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 02:02:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVqhU2877777
	for <ath12k@lists.infradead.org>; Mon, 3 Aug 2026 02:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+7RjX/m9QZtxkWfjOdvYYFL7PaaKqNCynQAQMzIlVF0=; b=GhINNymtcdIZCjZt
	93iFN41CchVFD7zlOxExfC5yBdJJ/53AJ7QZVePd976MqLy4GeOwKNI4n1iDmlaF
	rcXg4qUzm8Wd0gGR6hC4woaNgqPGaWoWSmS2pdsJ0Lk3wYig/wa961nA7XXdI3Ui
	/aAxlKD2L3og7LQm8TtYAJ98o40fGnLZD6l7T6UaEZfYAJMC3+D2KerypbHirG4o
	LtMiOsjGokWVJmOR1c+6Prlars2p4Ix6SDDZD+NOrar84muggCQfjkyf9PFOcqHt
	ByckHo4jdqh8y6PYPo+PHmYiJKraqOfN/UwIdHsPGnqsHWKQPlDfj86GP3Ft8a2m
	OKPuEg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vtc60r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 02:01:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e667368f0so5324315a91.2
        for <ath12k@lists.infradead.org>; Sun, 02 Aug 2026 19:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785722518; x=1786327318; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7RjX/m9QZtxkWfjOdvYYFL7PaaKqNCynQAQMzIlVF0=;
        b=VtKTQKyeZkj6Kk90Vv8fjjTCXbQRQwRI5+BUtE+3qR9loBlcCYN+zSNaWoWGQpFFM3
         MdATPUxRhLxMSKBQEM3HQ+YtkGN6okplKdtMzcLBHXqN0mT9Z3CfkPO+qpkP/D2vHxrH
         mTX6CTtxGvYQ1P2/TlvJ5EpI2oQTeUAU7XSc0+CY7geSQN3v3JOUHYcL6fccEjT4QeXz
         uxKmXhFVATkjh4iMmLUDz9wGTHunrWPEXt/Csk4phJz7PGAO85QEVXJHcHa3Lz8oornF
         uGBTsm/0z5RNCzGKNujnuIkARWNC20VsHwKRqmSsOyGZ7QvcY0MMvrXFRJs4VnLL2X/Q
         xW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785722518; x=1786327318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7RjX/m9QZtxkWfjOdvYYFL7PaaKqNCynQAQMzIlVF0=;
        b=nh+mlQuSo451Z0Q+Z3wmGtS51zpedCrG+tKuBHr76e4+/CEXyZ2OjPYqxSNJuT1YQ1
         j6YPvsqrNs1wq7jELde6IZz5YUePVuYbyODlPklFdGp7aHDVOFldnenoOXp60wMHpc+A
         UTUwzXufBtjW6w93rztgE3DDE987Lf+7mWdNOjXZYPPzJ7V/roQdmcGssVa37WvZ4Wwb
         sefPEA5D8gqZKFGUGNPe51Vbt3duRoLnwQqGKhUsg7SK0qXnAM34bB8DEcCNKXkdUzLk
         w+WIIUnCJTySXJutIpGpuXJ/E4zIObzz44QS8dJS2av1Zg08o2mDM94WXqtUKwWAHSJB
         HgZw==
X-Gm-Message-State: AOJu0YxUPAFAssELlYE0a1noyaXjF1FEocvf31asY8YekPsD73Xbv+Xe
	mMo4rldOhXYWZVaGjMF2PCNcuOg+EyF76mgpI7T1eM66e/Pq4tQ6KrfBKVW7s8s4G6biLUUt0ES
	djp9UbjDxa3lrQN2aJXgLUZWwGuHvZsCyx/72h0VDkx39Ch5Soe7sOZlvAHRSeB4L
X-Gm-Gg: AR+sD128q+gJOnPXtdMNDpxqCz9ZUlkdhwcHid4PGoD+zQJSAhnxx8WV01G+SggJyOT
	rfC/BFUFB9VAfNRhziknXKk4Gmb4Sx7l0R3eZ5gBHI94mS+ZAqZWuIq1yCLTeWwvHxSfXRWR6ER
	EIGJfNs/fu+a2HnuaTkZD2koSkT6N2yGFB2wN6WboanfNnZphKCQDjOV8ev0cmyjcaa0PjVHF3I
	H8LE+HACH76Zas2FinULxGOmDtfxhM+EnwB0AbjcFcalkXzM4bmElbxQ+oRKuPAJi4uWW5gUOLG
	bQQ5sk0r5jAo8VMsLL1W3DI+Qh+jizPnNnB/dW80jhLyPwJRCfs7xZQM27A3tWSjiuUyA8f2paP
	s+P2x5VMt8Qd/cQXsSIjVu6rnKhcifMap6aWXZKmJyohDRQHhmt8YXIX4tno=
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr6719993a91.11.1785722516762;
        Sun, 02 Aug 2026 19:01:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr6719953a91.11.1785722516255;
        Sun, 02 Aug 2026 19:01:56 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm44332605eec.19.2026.08.02.19.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 19:01:55 -0700 (PDT)
Message-ID: <05ff51f9-62d7-44fa-bdc4-1af3de2d5478@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 19:01:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unused
 ath12k_dp_rx_h_find_link_peer()
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
 <a990c25f-8f6c-49bd-90cc-9c4d0729fcc4@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <a990c25f-8f6c-49bd-90cc-9c4d0729fcc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAxMyBTYWx0ZWRfX7BUm/7tYQLMg
 /99yXX5Ch9YzvdD3F4llvld5DstgCj0uMZs2kLTLwWoJVpBwrtm4cEJYjEqYyaY200QF1Hb7r3+
 5WcAsdqoACF7g8kbNwrHH5ItrbGqQk4=
X-Proofpoint-ORIG-GUID: l0G3mFbJLpWrR2AZFXHnfTXOfHuGLuvN
X-Proofpoint-GUID: l0G3mFbJLpWrR2AZFXHnfTXOfHuGLuvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAxMyBTYWx0ZWRfX8BOmM2WGQofx
 ORCe8yyBPbnvfwz+QVpsc9jfPK1Zlj/fI8PkjjaR55X+0BmlITVpsOjIRIZUv54NnMq32voFyoT
 qT4ihLAYOLOPwGtv8X4B+asI9PaUrUkQD9IX6EbuY6EitqJ3+LifGhNehRCAkUIAd3B+RcilpmG
 AKB+dAq+qkiqW3ij8GsZMiky5tNsn6D5eliDvXv3FhfEJNlVxa2Wv1jTBboLMcU++Kb5mC9iZeT
 z9LORZ5qPhBQad6dOUIAcxaZkUHyt/baDRYh5pMFFN3mBZV7jhFjv0K5XgZLuCA8gtwkKSZBjgQ
 ElF53kkbxtH9KqnocNwtPryaz3ufZ6QZllxl4ITkNZNuT2B6i6MsKGl2Hkz5IwyOf1wvE56IpcE
 ao9ToHOOgp9DayTjNnzeIfm1ksKqTWAEcHj+V5J6yngx+CAuV4eapuDcqefmWOt14KbF+qf2y2p
 UZe2DiUUg01mpK5AeRw==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6ff696 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=lxulcXAl9rQatp6SiHsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_190201_368923_D5D10C7B 
X-CRM114-Status: UNSURE (   9.94  )
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

On 8/2/2026 6:54 PM, Baochen Qiang wrote:
> 
> 
> On 8/3/2026 9:05 AM, Miaoqing Pan wrote:
>> ath12k_dp_rx_h_find_link_peer() is no longer referenced anywhere,
>> remove the unused helper and its declaration to avoid dead code.
>>
>> Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1
> 
> is it OK to use engineering build in the Tested-on: tag ?
> 

Ideally we should test with upstream firmware, but for this case compile test
would be sufficient.

/jeff

