Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D325D767C3
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE6aKWhTIRDtt1HuTauz+eGXRCEosLmfMNuAXP3ZhEE=; b=BLx0pATHXNd2vP6RWqZXw/dTcV
	5dvpIIMwbjmMY3K/COTgPBV+aUhRQcOnA7A2ymQMFDKk/pukhZyB9P7b+CsdQO06NVNb2VNreqnUq
	vf/h8JVw1DRlhOKOYdRtx0Gte1GrTVkfPzChtnJd111ncLbpaxJFbmaA5k1UK+Bxm7TRD7EqdT6RH
	LzxjA2SXo3pqWXiCn6v7dpZEWZoQhM2fMvc8nxwf4jnNI35SyIoNCW/rLS5UAYULEDChfWWyoxmWJ
	/p36cVjc+Ewe39emnLWv1IzQCWousiN+FTFFXwxL9kvTs3mGJ6iYJwxvvkB9j9Cae6tqj9Z6MBfLW
	/3lSuZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXiz-0000000A4c5-12BM;
	Fri, 19 Dec 2025 10:28:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXix-0000000A4bQ-1Gvr
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 10:28:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c35u3939222;
	Fri, 19 Dec 2025 10:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE6aKWhTIRDtt1HuTauz+eGXRCEosLmfMNuAXP3ZhEE=; b=LmAZI2D1yR44XYbY
	tBjUKocjNtXrX1mwCMJ1QcJLM8AKgAvHVwMQp/fXx8LM1NT0zIluJeik5Pc4egTR
	HAqdMn+ql3hgAd0eFDluMu6bnH8t3VdEifxBdAfCAfymnCncM5mahgNaYjaymP/e
	8Pfpl/0uUx/ZSJ32Eux1HxFO6eJBgkFxkseIktlYwAVyUK0Pg50MAHpEVA/S22Jc
	ETV2EPQI49GG4z3dvGCN/D7/z4VU/68GpKgRDBIGkTwvsW2/BvnSpJUARVgJ9OOP
	alAEE/2k23qOM9C2m6mz7IbUbvkE4qaZBz17uTGfRR08Qmx+xjiWmDazApkBSeUj
	Hjcybw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2av8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 10:28:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BJASard022457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 10:28:36 GMT
Received: from [10.50.45.60] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 02:28:35 -0800
Message-ID: <29c8fb3e-dcf4-45ac-9a2d-d991550eecc9@quicinc.com>
Date: Fri, 19 Dec 2025 15:58:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] wifi: ath12k: Attach and detach ath12k_dp_link_peer
 to ath12k_dp_peer
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <ath12k@lists.infradead.org>
References: <aUOw3SVHgj1PsHBW@stanley.mountain>
Content-Language: en-US
From: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
In-Reply-To: <aUOw3SVHgj1PsHBW@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hDlK0mNf3xbTX5Fkyu1EJj8NjovhUwtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NiBTYWx0ZWRfXwbkdA+cxrszp
 fMQi17hgr0AWlx6+FhMfKz9X+FmUSt7P+GC0UpUCuKwcSrbMcljyoI/Gi3CsC5VrPvR+BQu2ug2
 Uz7D7cMQg8PRPIXxzTxMFeFHcYtfeZvWZYcsGRjLtM5BCpVlfMAseruSL/qDcxK9plxObvpNbMP
 X/Pfuy/DO3TbrzkiV3kwDeHhLbAMCbP/vnEwtfkk4HrtGrt6zahaisFoh5fpMcbpbVbvpRwETcX
 XdChIDYRTYBUDUuDBO1SIGxr+z8C5Zj0i5ALmqvPqVUWp4zgpryu20zIxZGcMfWT4MfzYqjU79J
 xnlllXDzo2WrlVPPpYcE9xYfAbyt3/A/AF21JbT51LxpEiOcRBO2+lH8wmvKUNUleVLXvEyzQNM
 Fx/i97Ju0EWTSWbKxVKqVCXNlx7H+wRpwflvRTbN11U76Q0Fft9gD73fzcmzbCJyRAIB0H9rWmS
 npi2yLoXT7QZzWGIJ+Q==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=694528d5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PZ4Fp49KZRMkXvJRJgcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hDlK0mNf3xbTX5Fkyu1EJj8NjovhUwtp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_022839_358589_88EB9BAA 
X-CRM114-Status: GOOD (  10.87  )
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



On 18-Dec-25 1:14 PM, Dan Carpenter wrote:
> Hello Harsh Kumar Bijlani,
> 
> Commit 5525f12fa671 ("wifi: ath12k: Attach and detach
> ath12k_dp_link_peer to ath12k_dp_peer") from Oct 24, 2025
> (linux-next), leads to the following Smatch static checker warning:
> 
> 	drivers/net/wireless/ath/ath12k/mac.c:1231 ath12k_mac_peer_cleanup_all()
> 	error: we previously assumed 'dp_peer' could be null (see line 1229)
> 
> drivers/net/wireless/ath/ath12k/mac.c
>      1206 void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
>      1207 {
>      1208         struct ath12k_dp_link_peer *peer, *tmp;
>      1209         struct ath12k_base *ab = ar->ab;
>      1210         struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
>      1211         struct ath12k_link_vif *arvif, *tmp_vif;
>      1212         struct ath12k_dp_hw *dp_hw = &ar->ah->dp_hw;
>      1213         struct ath12k_dp_peer *dp_peer = NULL;
>      1214         u16 peerid_index;
>      1215         struct list_head peers;
>      1216
>      1217         INIT_LIST_HEAD(&peers);
>      1218
>      1219         lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>      1220
>      1221         spin_lock_bh(&dp->dp_lock);
>      1222         list_for_each_entry_safe(peer, tmp, &dp->peers, list) {
>      1223                 /* Skip Rx TID cleanup for self peer */
>      1224                 if (peer->sta && peer->dp_peer)
>                                            ^^^^^^^^^^^^^
> This assumes that dp_peer can be NULL.
> 
>      1225                         ath12k_dp_rx_peer_tid_cleanup(ar, peer);
>      1226
>      1227                 /* cleanup dp peer */
>      1228                 spin_lock_bh(&dp_hw->peer_lock);
>      1229                 dp_peer = peer->dp_peer;
>                           ^^^^^^^^^^^^^^^^^^^^^^^
> 
>      1230                 peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
> --> 1231                 rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
>                                              ^^^^^^^^^
> Unchecked dereference.  It's not clear if it can be NULL or not.

Ack, shall raise the fix for this.

> 
>      1232                 rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
>      1233                 spin_unlock_bh(&dp_hw->peer_lock);
>      1234
>      1235                 ath12k_dp_link_peer_rhash_delete(dp, peer);
>      1236
>      1237                 list_move(&peer->list, &peers);
>      1238         }
>      1239         spin_unlock_bh(&dp->dp_lock);
>      1240
>      1241         synchronize_rcu();
>      1242
>      1243         list_for_each_entry_safe(peer, tmp, &peers, list) {
>      1244                 ath12k_dp_link_peer_free(peer);
>      1245         }
>      1246
>      1247         ar->num_peers = 0;
>      1248         ar->num_stations = 0;
>      1249
>      1250         /* Cleanup rhash table maintained for arsta by iterating over sta */
>      1251         ieee80211_iterate_stations_mtx(ar->ah->hw, ath12k_mac_link_sta_rhash_cleanup,
>      1252                                        ar);
>      1253
>      1254         /* Delete all the self dp_peers on asserted radio */
>      1255         list_for_each_entry_safe_reverse(arvif, tmp_vif, &ar->arvifs, list) {
>      1256                 if ((arvif->ahvif->vdev_type == WMI_VDEV_TYPE_AP) &&
>      1257                     (arvif->link_id < IEEE80211_MLD_MAX_NUM_LINKS)) {
>      1258                         ath12k_dp_peer_delete(dp_hw, arvif->bssid, NULL);
>      1259                         arvif->num_stations = 0;
>      1260                 }
>      1261         }
>      1262 }
> 
> regards,
> dan carpenter


