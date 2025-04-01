Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C20C3600C
	for <ath12k@archiver.kernel.org>; Tue,  1 Apr 2025 00:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cVIN1yqYhlAiuoox7wycBo/ZgfvnsCNIE+NcE0TS80=; b=q9FHGd1wfwYG7cqkMYoAqeJ8zl
	XOhhBmoPpIhi7pg2urAVCXwGrLs5WnsbLDynP8wLbsK81OJrc4+nbSEhVmBk9YA2tpogcMJXmq68x
	/HXnBXaLdnEPk5pvMsgA+VV2CTZa6UKr+5jOsXEBG1qH4FEqOmhsY0VORC1drsv6F7zuTKoZtcQIp
	nffWsiqpGsPK5zE9NQwlIhaNN4KDI0SQaDeofbxrfaAWNQ3CFIWPVVJyZWgpBegOQTHRD7kcRReKH
	Bjv8VzCOy76xc3eduidWP3md71RkNXHj+lwKobzxh1LM9EcBh3qC/cqQw/Y4YMw5pvv20zYnJi1aZ
	5yf4pTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzP6j-00000001d7D-06H6
	for ath12k@archiver.kernel.org;
	Tue, 01 Apr 2025 00:03:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzP6e-00000001d6q-3idN
	for ath12k@lists.infradead.org;
	Tue, 01 Apr 2025 00:03:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCqcx023461
	for <ath12k@lists.infradead.org>; Tue, 1 Apr 2025 00:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cVIN1yqYhlAiuoox7wycBo/ZgfvnsCNIE+NcE0TS80=; b=GX6A6i50xwhx/WZH
	3ruXVHt+GpN71ExJSeJMNJoS7fOIYoz3GGUe+m485hFHUFa3HBiIKIBXQx1LG/sr
	LQyxuFzWTKckFDo52E3uLfX1eYPO3Sdj7d3Zp2bz6NIOzrFuzE+/b528VAh0Wfzl
	JbSFV37KJES05TzDfyQCr6hIHxnWJEef8SzCXPxJ+Ppu3bfsDdARFMica4imbqmQ
	9f3lrVftdGTrGRnrGb5kabLXwjBazuB6SRLnRxmex3VPXcCIVbQos63o1EfkRDJ5
	N4KCEHC8L7wtyOJWdTtOg1j2o5JR15hqDOCPrsbJqpNHiRmVS+eykw/5AvJvNSjy
	Oh8SeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8xvdxr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 00:03:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227a8cdd272so81789205ad.2
        for <ath12k@lists.infradead.org>; Mon, 31 Mar 2025 17:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743465828; x=1744070628;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cVIN1yqYhlAiuoox7wycBo/ZgfvnsCNIE+NcE0TS80=;
        b=d1Q24B5e24QjpmR0RBt/I9wa8lNLOJobb/JUE65czKZ+/InOQBn0zJdKIWqAXena+N
         cMfns2KGcxeXUeunONtl7JqRABFBcuFETnnUA5rWd+yiOKXEMIQnYx0Ws4LJUfyFwe8S
         nJz3gOzE6tFhHSHb+6SJ1qzEYlHlKRyq7/2F6weO9kFmHyJKiMoxt5EdqIyVFfrZLa9Z
         W9mM1Qr7OvMH2C0h4olKsEiRUCp2ZowT2RYHS4JLKHGCItKl39XIxll69bn+ijpU8nMq
         2f3hSBdQiOTP+UlkIQ+izXL5VIvV0aKUOIG75OHM4Y2KinfLz9M6MDndd9DJhMXtHcog
         2z5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+PWnBgols8FB1UCAJaquOL2rO6PfR3NJdyvl2/TyjScHSW19khDBG3UPDPyUqgcflhLXAC/U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNKDI4T99zlWB/KiV3fxIk8ZjIOTIwYed8xvj+gZhFs94/Le58
	WFutkiY1P0UebFNAGTNBubvMGI6xXmym6pfK5UocTbYMDOosFxDOj9fs8Owk2pYbZGM4iXqpK5W
	YM1TFPyMokmiWxehG3fgQJe6gDJFH0bZmwxZUz7762WWqEofjBrx/Vpz/Ze0WHCBNLnxT
X-Gm-Gg: ASbGncvn4HwSHemE+McX1kmqdBAAk4ypSrzdHZoiZJ/wkvIpZ3RyUy9J/L0+D+A3A1c
	F+/RXYrTJ4GGvPq2l5+jy5l+27TGo0/n+hxw4i41FCqz82bw33e8pzRgoyb4Ayg7cCn9QdT7bVl
	J8CJGF8NUWlvblYe7n8s9PlmTUjVQTmNCYFBc0NJT3jJlAiPuJMh4i7si84BGaDXDuA7pVmz9Gc
	TT5L+VjnXFiAjTwovZIeoYUOH12RwCEGttNul+42v7or/QEZoijWYbMFLtzWfgzJ0G8ztTTQFr9
	gEzU2j1Xp45YnJKfi0W8uwGx74ktqXBWbs0ZKLZPetRUVGwSGQjF9b6Z7hyR07vTVHW9/IQRpx/
	UqdSEwRDj
X-Received: by 2002:a17:902:f54a:b0:216:53fa:634f with SMTP id d9443c01a7336-2292f9ef20emr175664775ad.48.1743465827813;
        Mon, 31 Mar 2025 17:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnMu2P7tyWZHMH46/iz8oKR/XbzPFIZC5WUvTC01ExGdFd92nY5GkYQ0CBpwAML4SYY8sXxw==
X-Received: by 2002:a17:902:f54a:b0:216:53fa:634f with SMTP id d9443c01a7336-2292f9ef20emr175664275ad.48.1743465827319;
        Mon, 31 Mar 2025 17:03:47 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedc988sm76155715ad.59.2025.03.31.17.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:03:46 -0700 (PDT)
Message-ID: <64839c85-38f4-4a13-9ee1-273aed339a47@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 17:03:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath12k: Add support for link specific datapath
 stats
To: "Tamizh Chelvam Raja (QUIC)" <quic_tamizhr@quicinc.com>,
        "Balamurugan Mahalingam (QUIC)" <quic_bmahalin@quicinc.com>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20250203213237.2695131-1-quic_bmahalin@quicinc.com>
 <BL3PR02MB8163BE57AD5EF563FD8A76B383F72@BL3PR02MB8163.namprd02.prod.outlook.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <BL3PR02MB8163BE57AD5EF563FD8A76B383F72@BL3PR02MB8163.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 81wuMOZSgVVn5KMgWai1z6h6V5Meiu4w
X-Authority-Analysis: v=2.4 cv=PquTbxM3 c=1 sm=1 tr=0 ts=67eb2d65 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=UjqVY_aGyNUKZPdAsKEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 81wuMOZSgVVn5KMgWai1z6h6V5Meiu4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=950 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_170353_122309_57AFF35A 
X-CRM114-Status: GOOD (  17.56  )
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

On 2/4/2025 10:37 PM, Tamizh Chelvam Raja (QUIC) wrote:
...
>> +static int ath12k_open_link_stats(struct inode *inode, struct file
>> +*file) {
>> +       struct ath12k_vif *ahvif = inode->i_private;
>> +       size_t len = 0, buf_len = (PAGE_SIZE * 2);
>> +       struct ath12k_link_stats linkstat;
>> +       struct ath12k_link_vif *arvif;
>> +       unsigned long links_map;
>> +       struct wiphy *wiphy;
>> +       int link_id, i;
>> +       char *buf;
>> +
>> +       if (!ahvif)
>> +               return -EINVAL;
>> +
>> +       buf = kzalloc(buf_len, GFP_KERNEL);
>> +       if (!buf)
>> +               return -ENOMEM;
>> +
>> +       wiphy = ahvif->ah->hw->wiphy;
>> +       wiphy_lock(wiphy);
>> +
>> +       links_map = ahvif->links_map;
>> +       for_each_set_bit(link_id, &links_map,
>> +                        IEEE80211_MLD_MAX_NUM_LINKS) {
>> +               arvif = rcu_dereference_protected(ahvif->link[link_id],
>> +
>> + lockdep_is_held(&wiphy->mtx));
>> +
> 
> Here arvif can be NULL, so it would be good to check before using it.
> 
>> +               spin_lock_bh(&arvif->link_stats_lock);
>> +               linkstat = arvif->link_stats;
>> +               spin_unlock_bh(&arvif->link_stats_lock);
>> +
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                "link[%d] Tx Unicast Frames Enqueued  = %d\n",
>> +                                link_id, linkstat.tx_enqueued);
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                "link[%d] Tx Broadcast Frames Enqueued = %d\n",
>> +                                link_id, linkstat.tx_bcast_mcast);
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                "link[%d] Tx Frames Completed = %d\n",
>> +                                link_id, linkstat.tx_completed);
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                "link[%d] Tx Frames Dropped = %d\n",
>> +                                link_id, linkstat.tx_dropped);
>> +
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                "link[%d] Tx Frame descriptor Encap Type = ",
>> +                                link_id);
>> +
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                        " raw:%d",
>> +                                        linkstat.tx_encap_type[0]);
>> +
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                        " native_wifi:%d",
>> +                                        linkstat.tx_encap_type[1]);
>> +
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                        " ethernet:%d",
>> +                                        linkstat.tx_encap_type[2]);
> 
> Like encrypt type stats below this also can be put it in a loop.
> 
>> +
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                "\nlink[%d] Tx Frame descriptor Encrypt Type = ",
>> +                                link_id);
>> +
>> +               for (i = 0; i < HAL_ENCRYPT_TYPE_MAX; i++) {
>> +                       len += scnprintf(buf + len, buf_len - len,
>> +                                        " %d:%d", i,
>> +                                        linkstat.tx_encrypt_type[i]);
>> +               }
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                                "\nlink[%d] Tx Frame descriptor Type = buffer:%d
>> extension:%d\n",
>> +                                link_id, linkstat.tx_desc_type[0],
>> +                                linkstat.tx_desc_type[1]);
>> +
>> +               len += scnprintf(buf + len, buf_len - len,
>> +                               "------------------------------------------------------\n");
>> +       }
>> +
>> +       wiphy_unlock(wiphy);
>> +
>> +       file->private_data = buf;
>> +
>> +       return 0;
>> +}

Hi Maha,

I didn't see any response to the two feedback comments given.

I'd like to clear this patch from my backlog, so either need a response why
the feedback isn't applicable or need a v5 which incorporates the feedback.

Thanks!
/jeff

