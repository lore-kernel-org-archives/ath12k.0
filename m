Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC8EC79F89
	for <ath12k@archiver.kernel.org>; Mon,  7 Sep 2026 04:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4whZOxnHdG9aly2zjOMfcepTeMJ8B/tTJlEIlYa/i24=; b=iaZw9oePJJk41T8BficEYo4YX7
	q/gkiE8Zt2CnjVBzCrXVBN3DKgSFlqSbOb/I+tGAVsyZ/9ahHturouIOIM6U68uk0t5K9oz0lWp6F
	ILWxCjIq9S00acd+NMvQd/X9AWd1dUfLf6y8RAWCSvJEdA8ihUqTYFswLYgwcj+ZvLR7QkBnKxAoz
	GCnQj1uWrXO+pb1oz8Px5XlqEiNYYS53Av7g5hjXke00ZPlXSn81UJC7t3xAbJeO4gjZ54C84tBqp
	vaCkjv3cus0QiyiQUynDZsSPmoqa8gB4F02LdSK52FTa6yZpNIEEYJp/92n6wnWip19UkJNJ+T7pF
	OY1fbkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RSV-00000005u7Y-2wed;
	Mon, 07 Sep 2026 04:59:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RSU-00000005u7D-0oOJ
	for ath12k@lists.infradead.org;
	Mon, 07 Sep 2026 04:59:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kwG53712181
	for <ath12k@lists.infradead.org>; Mon, 7 Sep 2026 04:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4whZOxnHdG9aly2zjOMfcepTeMJ8B/tTJlEIlYa/i24=; b=PqVepuDeTiBsjJyT
	qNeAnOnEGkFo9sVpbTFTEwqPoXR9yeVINTCFD+tGDRP3KCIq9lAEPAz89QVgKHZr
	L/QqC2BPXhbCAqKhDPxKP/Xus8vILDFNhDm9RHulYG29Tjw6xAqKtezRlBkPxkJQ
	kStse+OoRlg0T0g44V5jKH6r+TXLl8yXUIn3MTWoNr2SKoNdKBhIH+6eYoUIF+9P
	fH/+fi3JJf2LsihKkanZxt/3svANfvNarHw8IeR2TfZJfAkoG/USraz5C4Ca8cWi
	093OBUKj9alpGFiQRfKJS/D46YHSEXtfjdcNsgvAF/ayWkYcs+YPyGbbFQvSysMb
	SxELtQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjguse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Sep 2026 04:59:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so3386487a12.0
        for <ath12k@lists.infradead.org>; Sun, 06 Sep 2026 21:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788757192; x=1789361992; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4whZOxnHdG9aly2zjOMfcepTeMJ8B/tTJlEIlYa/i24=;
        b=DhNXBY677UcpGqkG5G96MNPk+O+2LtOX/MXv47L1kySWDN/nIJ7mJ+S4q6iLTvDPMu
         3LblBASBIiTIA/HfCkUYQDyifpjn5bhTfJ2zj+eKFO7KBoRvA5tHf4GDyZwajHdWL+VD
         0fsqqb479X52ksKau66eH7IR4/8Il77RhwTbqkYavhTmOWG+t6u1eUFMDv4gRkob3/ej
         YjPmKdJHVVzmWOS5AAqKcDyBV69zHEITVaAFzPS2nu9XQzAGpw9mO9cP2EAATkmyzPXM
         Q+9QEhgJK0TX+r1D68m9Kd9DzlUH1FdTkZyZfDmCyQMKSLc4xPpUBZ0MsucCYyPd9sNl
         5xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757192; x=1789361992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4whZOxnHdG9aly2zjOMfcepTeMJ8B/tTJlEIlYa/i24=;
        b=BqDxcFGlOI035QgyD39tPYVkIFIfAMzsAAGM3F5+DkPNXdIh+lJitvgE1OukNLrZLL
         Y/9p31b1x+DBCw+/VEXxSb/NIKwtG5cOC6lzpffXqHwbbjWGlBYU/OGWuVAgbk8sI+nP
         XVcuLnaVdaznGukLOt8xfiPyrs40VbAMsZxNJF70KfMe9YCGz8Gsdbw30z50/EzNCv8e
         mlumAr6blBe6qMz4jj2izAkU7COTNJzswLfeVexYWe4hLwuAO9iMdSFn48DitnhSniYl
         wfEAY9yotW9Mq7MyIZRNIFoeokcAG2fjLbL+t8w/OF8dJAbayuH7daUAO0kd52NEevld
         SSPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCM3CRxrykKZOG34i3Fxd2nlbztZ+z25LoZRWJTnsx1R8PIX54LPKaIiGZl4tMTfuR2/PLFTQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mv7SjT8Fhdkc1qqBQTG1xyKi3qn/DqM9WZiOv9Az71Jhz6EXwe
	Q42d7AbjSyOgrnuW88OaoZLUlofc7my6+WtysLC5a3hglN6zSFYx4Znzzn7tVl/Eq22Zd0aorIc
	S+NeTFRlOw8WT6WajM/IwQRg64ommO3jYOjQ2fX109IJcZ5hATSLjuUWmOonsMxXl
X-Gm-Gg: AYBFou2+MN2sHttRhX57MgC/3sipZJixznMA3VPeGwXgfItXM06zbP6tnfBRW4ltcDs
	9xFf9IruRfS2y64UZnOSeG7nQlNuiw/IlfnZFZ2LMEszCGTFgJj6L/RLhTLBeQlHOVUyUTDE8ZZ
	L31YPAUOTuICR9UDYKRj3E2uiq268w6VVCz4Z6aZeJPVX49j8gPL2oToP73e9eywApBrmddarp9
	McpHwOPsVn3G4mKRVjCot44TURrGKXYCC2D2tRnVtmBeoxERuW3YMaD4sWuXsFHG+f4TIuXwVLT
	jzvA2esxxK3hzxSPt/h2aMod+KVjYDq7WXx5jaUgbR1rWfYMzl83yOC3g3ZDta4B433JjYrTNgg
	6y8rS99K3HG50B4LpVdsS1Z/6naatZswpgVT3aQiOn3Ms/0JSfFRvs50fPDa/e2WP2g==
X-Received: by 2002:a05:6a20:7284:b0:3cc:f280:ebc6 with SMTP id adf61e73a8af0-3da39eacf9amr28608217637.5.1788757192439;
        Sun, 06 Sep 2026 21:59:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:7284:b0:3cc:f280:ebc6 with SMTP id adf61e73a8af0-3da39eacf9amr28608157637.5.1788757191898;
        Sun, 06 Sep 2026 21:59:51 -0700 (PDT)
Received: from ?IPV6:2409:40c4:36:4638:29e7:e0b1:d1ef:dcca? ([2409:40c4:36:4638:29e7:e0b1:d1ef:dcca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm37726261eec.15.2026.09.06.21.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 21:59:51 -0700 (PDT)
Message-ID: <e1c37fbb-48db-4ffb-b1b9-bedcde507970@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:29:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
To: Johannes Berg <johannes@sipsolutions.net>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
References: <20260820052426.3177309-1-aaradhana.sahu@oss.qualcomm.com>
 <47c4ba195ae49552538ea65f4f13de7d3dced266.camel@sipsolutions.net>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <47c4ba195ae49552538ea65f4f13de7d3dced266.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1MCBTYWx0ZWRfX9IqkNFiRJzW+
 kJJ4Rc23WM5LhDnjTzTH9m8DkYxQsT6/QSNEuuoXWFhII6WNjD9d/PpQ3f9nhLQZMltAF0myj85
 h39FI0nHY20AYafWO3u0mh9re1PupnA=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e44c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=1VyEs0PO2QFJR4dUXpwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bZFJaJDGeMdc_klEv1xIkFmWyFpPluI6
X-Proofpoint-ORIG-GUID: bZFJaJDGeMdc_klEv1xIkFmWyFpPluI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1MCBTYWx0ZWRfX1+w6HUBrQpDh
 d26H8RVrC8gTHdpF/SYl7+jXcACcBXdD08IykN+8EO5dxGQKLr7+kRvJVDaVOYHVInjEQgeN6Xa
 Xi/hJuPLq6NEKxYSpcE3fuAVHbdFxP8mBz5A+Gctyk6KnXA9BDZUT+cZ0gY6TAuYVxwF+2P/Hy6
 7DreUQY4WMZQj7xIhp9Cspf55V7KSUIoEsclyd5tMWivXGdFn2gFg0ROY/qxs/qUnsCBOrX73y9
 +TEbNeeId3sAjGXWgwq5IdZY4RmecJ7ngyUh8UNB+xA/iZFzzM+Lh1gIUw+CjUCGQqb4FTgofEc
 ABc5UcsAkhcTy2pXIxuf1STRR+OednN5MUbdjKBh8Hgv93kmguRnT7mvgiFHoVsB7MWfY1N2Mtl
 FbwvqSopMdSsh6zfYG5/VqWzJTKlrPlowV74mDpwJvj/C8Z4KLzFIVy0ZhV8T5HXTvcxah/MMJu
 Tf+QPxpTssdhPvajfKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215954_241254_35237BB5 
X-CRM114-Status: GOOD (  16.27  )
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



On 9/4/2026 4:08 PM, Johannes Berg wrote:
> On Thu, 2026-08-20 at 10:54 +0530, Aaradhana Sahu wrote:
>>
>> +struct ieee80211_bss_conf *
>> +ieee80211_get_sdata_bss_conf(struct ieee80211_sub_if_data *sdata, int link_id)
> 
> not sure I think this function is all that useful, but
> 

Thanks for the review. Since both sta_set_link_sinfo() and sta_set_sinfo() use this helper,
I introduced it to avoid duplicating the BSS configuration lookup logic in both callers.
I can remove it if you prefer.

>> +{
>> +	struct ieee80211_sub_if_data *bss_sdata = sdata;
>> +
>> +	lockdep_assert_wiphy(sdata->local->hw.wiphy);
>> +
>> +	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN) {
>> +		if (!sdata->bss)
>> +			return NULL;
>> +
>> +		bss_sdata = get_bss_sdata(sdata);
>> +	}
> 
> at the very least that part is pointless, and should just be a
> get_bss_sdata() call?
> 
> or are you saying you somehow found a VLAN existing with sdata->bss
> being NULL?
> 
> johannes

Yes, you are right. The sdata->bss NULL check is unnecessary here.
I will remove it and send the next version.


