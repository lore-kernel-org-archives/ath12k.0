Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7894BC48260
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 02:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+Eea2bQciagdDZRBsqMHdL6LsAgVPGvqZZ6JAM01QQ=; b=Xfqz1QRN4p6NTZx7FDQi2s0p45
	JzRv3QXlWlcC8vzaTtskoOQh9tqDmyBUPR++K90XyVaMUJO3xZZvZelkl5orxH4yWO7ACF33IDz+/
	/Yg/oBKOPLZtWvzMla0cHu+STxGYKpPxQGbuhJvA+igSLvQdcmvujlL9KrEIK8+NDqykULDR+V4a6
	LS8GfAeqZ1hqrES1ywo/h+If92vt7qFUM+JU8eQB6KmVfClRo93Cqe3bUG5ZDhbbeqtqoZgbDyVjO
	GENemLbBUuFd/PPBzqZHkCnqLavzYDGKbXzEaVrgMNtjirmJC/p1OwW+eDxIPj2znfs12l8aUT0MB
	D9sA2XUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXB5T-00000005mnV-0ccj
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 02:21:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXB5Q-00000005mmZ-1xAz
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 02:21:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4161eTD7008070;
	Tue, 6 Feb 2024 02:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=N+Eea2bQciagdDZRBsqMHdL6LsAgVPGvqZZ6JAM01QQ=; b=DV
	Zsd3Yp7YfK9cjq/EUXYTwXk70owXPdbWqe1SQWfKbjJZ+62l4A3F/Oci+SjA/tcC
	ReFq/jHd1vBGz7A1s3+f8TsrxxhhyVAOWklc7bNwGVt/HAavobyF4pa4zRki9xVQ
	OegJ6c7zKypv2SFrETi/FxSx8gDHu8DoO0y0Lj/X19K85HyrbM+4+qRaPufICeoN
	rZHIzZ/4gfWR1+8C96oK2bHywzG+XLGEM4x9+hcyzpAKgov0YHDA9t4EHNc6xqNb
	X+ODh5FGyuo1eYGMPptRdeEdwWXgu3NI3bIW7sfAcjN/wklfx0hVmwmjlocnVi+E
	DPBJhjLXse/vV1o9GFpw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w2v72a8kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 02:21:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4162LHjx029819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Feb 2024 02:21:17 GMT
Received: from [10.253.73.189] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 18:21:16 -0800
Message-ID: <bc5baff6-83c9-44ec-9beb-a863045194da@quicinc.com>
Date: Tue, 6 Feb 2024 10:21:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] wifi: ath12k: implement handling of P2P NoA
 event
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-6-quic_kangyang@quicinc.com>
 <871q9vt1km.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <871q9vt1km.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g6SwpuT334Y_qNTROufmFFQnEz6NRBiv
X-Proofpoint-ORIG-GUID: g6SwpuT334Y_qNTROufmFFQnEz6NRBiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_18,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=782
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_182124_663401_E7258C30 
X-CRM114-Status: GOOD (  13.54  )
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



On 2/2/2024 9:53 PM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> The NoA(Notice of Absence) attribute is used by the P2P Group Owner to
>> signal its absence due to power save timing, concurrent operation, or
>> off-channel scanning. It is also used in the P2P Presence Request-Response
>> mechanism.
>>
>> The NoA attribute shall be present in the P2P IE in the beacon frames
>> transmitted by a P2P Group Owner when a NoA schedule is being advertised,
>> or when the CTWindow is non-zero.
>>
>> So add support to update P2P information after P2P GO is up through
>> event WMI_P2P_NOA_EVENTID, and always put it in probe resp.
>>
>> Create p2p.c and p2p.h for P2P related functions and definitions.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> 
> This patch 5 had simple conflicts in wmi.c, please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=cbcb45c458a93d32a48b9280c13294e0853fa5dd
> 

Sorry for late reply, I am in Spring Festival holiday. It seems i have 
conflict in adding WMI event, because you merge TWT patch-set before.


conflict:
root@Mayan:/home/yk/ath12k-upstream/drivers/net/wireless/ath/ath12k# cat 
wmi.c.rej
diff a/drivers/net/wireless/ath/ath12k/wmi.c 
b/drivers/net/wireless/ath/ath12k/wmi.c    (rejected hunks)
@@ -162,6 +163,10 @@ static const struct ath12k_wmi_tlv_policy 
ath12k_wmi_tlv_policies[] = {
                 .min_len = sizeof(struct wmi_probe_resp_tx_status_event) },
         [WMI_TAG_VDEV_DELETE_RESP_EVENT] = {
                 .min_len = sizeof(struct wmi_vdev_delete_resp_event) },
+       [WMI_TAG_P2P_NOA_INFO] = {
+               .min_len = sizeof(struct ath12k_wmi_p2p_noa_info) },
+       [WMI_TAG_P2P_NOA_EVENT] = {
+               .min_len = sizeof(struct wmi_p2p_noa_event) },
  };

  static __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -6807,6 +6853,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base 
*ab, struct sk_buff *skb)
         case WMI_RFKILL_STATE_CHANGE_EVENTID:
                 ath12k_rfkill_state_change_event(ab, skb);
                 break;
+       case WMI_P2P_NOA_EVENTID:
+               ath12k_wmi_p2p_noa_event(ab, skb);
+               break;
         /* add Unsupported events here */
         case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
         case WMI_PEER_OPER_MODE_CHANGE_EVENTID:



TWT patch change:

@@ -164,6 +164,8 @@ static const struct ath12k_wmi_tlv_policy 
ath12k_wmi_tlv_policies[] = {
  		.min_len = sizeof(struct wmi_vdev_delete_resp_event) },
  	[WMI_TAG_TWT_ENABLE_COMPLETE_EVENT] = {
  		.min_len = sizeof(struct wmi_twt_enable_event) },
+	[WMI_TAG_TWT_DISABLE_COMPLETE_EVENT] = {
+		.min_len = sizeof(struct wmi_twt_disable_event) },
  };

@@ -6798,10 +6829,12 @@ static void ath12k_wmi_op_rx(struct ath12k_base 
*ab, struct sk_buff *skb)
  	case WMI_TWT_ENABLE_EVENTID:
  		ath12k_wmi_twt_enable_event(ab, skb);
  		break;
+	case WMI_TWT_DISABLE_EVENTID:
+		ath12k_wmi_twt_disable_event(ab, skb);
+		break;
  	/* add Unsupported events here */




Do i need to send a new version ?



